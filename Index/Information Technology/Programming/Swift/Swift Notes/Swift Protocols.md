
- **Links**
	- [Emerge Tools Blog | The Surprising Cost of Protocol Conformances in Swift](https://www.emergetools.com/blog/posts/SwiftProtocolConformance)

## Associated types (Generic protocol)

Associated types is like generics. So protocols with associated types can be called **generics protocols**

```swift
protocol Employee {
	// Associated types can have constraints like this
	associatedtype Manager: Employee
	var manager: Manager? { get set }
}
```

Properties are always declared as var. Can by `{ get set }` or `{ get }` ****(only `{ set }`is impossible)

When you create a variable without type, but which only conforms to the protocol instead, it is always created in the existential container which uses static dispatch.

## Recursive protocols

This is where the use of class rather than struct becomes important: if a struct has a property of its own type, it will become an infinitely sized struct – object A might contain object B, which might contain object C, and so on. Classes don’t have this restriction because their memory layout is different: a class can contain instances of itself without becoming infinitely sized.

## Protocols in memory

If we have and `Array` of protocols Swift will allocate all of items in heap and make array of pointers (because it can't be shure what size of elements and Array shound have elements of equal sizes). Example

```swift
struct Person {
		let name: String = ""
}

let array = [Person(), Person()] // ok, fixed size elements, all of them on stack

protocol Something {}
struct Person: Something {
		let name: String = ""
}

let array: [Something] = [Person(), Person()] // element of array could be anything: struct, class, Int, etc. so swift allocates every in heap
```

## Has value semantics by default

> Use a class-only protocol when the behavior defined by that protocol’s requirements assumes or requires that a conforming type has reference semantics rather than value semantics.

```swift
protocol AlphaProtocol {
    var message: String? { get set }
}

final class AlphaObject: AlphaProtocol {
    var message: String?
}

final class Controller {
    var alphaValue: AlphaProtocol! {
        didSet {
            print("New alphaValue has been set")
        }
    }
}

// prints New alphaValue has been set 2 times (has value semantics)
let controller = Controller()
controller.alphaValue = AlphaObject()
controller.alphaValue.message = "New message"

// If we make a little change code below will print “New alphaValue has been set” one time so it has reference semantics
protocol AlphaProtocol: AnyObject {
    var message: String? { get set }
}
```

## If protocol is returned as forced unwrapped than it still an Optional value

```swift
protocol Intable {
    var kek: String { get }
}

extension Int: Intable {
    var kek: String { .init(reflecting: self) }
}

func kek() -> Intable! {
    1 as? Intable
}

func lol() -> Int! {
    "1" as? Int
}

print(kek()?.kek) // if protocol is returned as forced unwrapped than it still an Optional value
print(lol().hashValue)
```