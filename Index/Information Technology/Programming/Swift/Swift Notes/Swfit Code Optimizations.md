```sh
# prints raw SIL to stdout
swiftc -emit-silgen -O <file>.swift
```
- *Boxing* - value type wrapped in reference type i.e. allocated on the heap
	- When this *can* happen? (this is not happening when compiler can perform inlining of the type)
		- When conforming to protocol
		- When storing reference type inside value type
		- Generic value type
		- Escaping closure capture
			- can be optimized -> In Stack Promotions about Capture
		- `inout` argument
			- in most cases can be optimized 
- *Stack Promotions*
	- i.e. heap allocated types can be allocated on stack instead
	- When this *can* happen?
		- [swift/CapturePromotion.cpp at 31b167468793ec5b25a6c4e0769e2883d6125049 · apple/swift](https://github.com/apple/swift/blob/31b167468793ec5b25a6c4e0769e2883d6125049/lib/SILOptimizer/IPO/CapturePromotion.cpp)
			- if closure do not modify captured variable 
			- if we can prove that all mutations to captured variable happend before closure created
			- in real life that means
				- if closure captures local `var` -> allocates it in heap
				- if closure captures local `let` -> copy value
		- [?In some cases when heap allocated type consists of simple stack allocated types -> move them to stack?](https://github.com/apple/swift/blob/62ccf81f7748e3e2c8626354d1ecb3adbd26b063/lib/SILOptimizer/Mandatory/PredictableMemOpt.cpp)
		- [?Same as above?](https://github.com/apple/swift/blob/62ccf81f7748e3e2c8626354d1ecb3adbd26b063/lib/SILOptimizer/Transforms/AllocBoxToStack.cpp)

- If array element is **value** type - use **Array**
	- this gives performance boost because value types can’t be stored in NSArray so compiler can remove overhead cost by bridging with `NSArray`
- If array element is **class** and no need to bridge with NSArray - use **ContiguousArray**

```swift
// redundant copy
 func append_one(_ a: [Int]) -> [Int] {
  var a = a
  a.append(1)
  return a
}

var a = [1, 2, 3]
a = append_one(a)

// no copy will accure 

func append_one_in_place(a: inout [Int]) {
  a.append(1)
}

var a = [1, 2, 3]
append_one_in_place(&a)
```

## No overflow check addition

```swift
let a = Int.max &+ 1 // Int.min
print(a == Int.min) // true
let b = Int.max + 1 // exception
```

## Writing code without ARC (example iterating through nodes of linked list)

```swift
// The call to ``withExtendedLifetime(Head)`` makes sure that the lifetime of
// Head is guaranteed to extend over the region of code that uses Unmanaged
// references. Because there exists a reference to Head for the duration
// of the scope and we don't modify the list of ``Node``s there also exist a
// reference through the chain of ``Head.next``, ``Head.next.next``, ...
// instances.

withExtendedLifetime(head) {

  // Create an Unmanaged reference.
  var ref: Unmanaged<Node> = Unmanaged.passUnretained(Head)

  // Use the unmanaged reference in a call/variable access. The use of
  // _withUnsafeGuaranteedRef allows the compiler to remove the ultimate
  // retain/release across the call/access.

  while let xext = ref._withUnsafeGuaranteedRef { $0.next } {
    ...
    ref = Unmanaged.passUnretained(Next)
  }
}
```

## Use let instead of var when capturing in escaping closure

Because when var is captured by closure it’s need to allocate memory in heap to provide access to read/write to it for closure and for variable itself. (This applies event so simple types as Int).

If it’s let then value can be simply copied into closure internal storage without additional allocations

```swift
var a = 4

let b = {
    // this closure will allocate heap memory for a to allow writing to it 
    print(a)
}

let a = 4

let b = {
    // no heap allocation just copy 😎
    print(a)
}
```

## Advice: Pass var as an inout if closure not actually escaping

If one is using an escaping closure for expressivity purposes, but is actually using a closure locally, pass vars as inout parameters instead of by using captures. The inout will ensure that a heap box is not allocated for the variables and avoid any retain/release traffic from the heap box being passed around.

```swift
// ⛔️ bad, alloc in heap for a stored in b
func kek() {
    var a = 4
    // escaping but not really 
    let b = { a += 1 }
    b()
}

// ✅ nice, no allocations 😎
func kek() {
    var a = 4
    // escaping but not really 
    let b: (inout Int) -> Void = { $0 += 1 }
    b(&a)
}
```

## Lifehacks

Use += instead of + in reduce

![[Writing High-Performance Swift Code/group(by_)_loop_with_subscript__get_set.png]]_loop_with_subscript__get_set.png)

Red line is exclusive access (like & param)

`yield` only can be called once (due to exclusive access to value). It's like [[inout]]  returned value

![[Writing High-Performance Swift Code/mutation_happens_in-place.png]]

```swift
[1, 2, 3].reduce(into: [], +) // O(n^2) - creating array on every iteration 

[1, 2, 3].reduce(into: [], +=) // O(n) because append not creating of array every time
```
