# Computer Memory

**All memory is divided on chunks of 8 bytes (machine word) (usually word.size() == memory_address.size())**

**Each byte of memory is associated with address of 8 byte size in virtual space (in case of 64 bit system)**

![](Computer%20Memory/Address.png)

Pointer is pointing to a first byte of memory block and general length of type is counting by first address + sizeof(type)

**THAT MEANS THAT ADDRESS IS TAKE 8 BYTES TO BE STORED BUT NOT MEANS THAT DIFFERENCE BETWEEN VALUES IT’S STORED (ACTUAL ADDRESS REPRESENTATION) WILL BE 8 BYTES TOO. This is because pointer size is not connected to actual data it refers too and for example if we have an array of int32 values than if we get addresses of each element of array they difference will be equal to 4 bytes (32 bit), but if we’ll get sizeof() pointer to that items it will be 8 bytes.**

**[32bit system vs 64bit system: 32bit is system where maximum memory address size is 4 bytes, 64bits - 8 bytes](32bit%20system%20vs%2064bit%20system:%2032bit%20is%20system%20where%20maximum%20memory%20address%20size%20is%204%20bytes,%2064bits%20-%208%20bytes)**

**[Word - 8 bytes]([https://medium.com/swlh/unsafe-swift-a-road-to-memory-15e7d7e701f9](https://medium.com/swlh/unsafe-swift-a-road-to-memory-15e7d7e701f9))**

It denotes the number of bits that a CPU can process at one time.

**Pointer size is equal to size of there word on the system**

**Padding** - amount of bytes added to type to be aligned in memory

**Alignment**

**[https://www.youtube.com/watch?v=OKjOZBaKlOc](https://www.youtube.com/watch?v=OKjOZBaKlOc)**

So type is alignment is calculated depend on machine basic sizes.

So type is aligned if:

- Type is 1 byte it is allowed to be stored in any address
- Type is 2 bytes (**half of machine word** on 32-bit system) than is allowed to stored starting at **event addresses**
- Type is 4 bytes (**machine word** on 32-bit system) the it allows to be stored at addresses that are **divisible by 4**
- Type is 8 bytes (**double machine word** on 32-bit system) the it allows to be stored at addresses that are **divisible by 8**

**Better example of this in [Swift memory layout](Swift%20memory%20layout)**

**[Swift memory layout]**

**[https://stevenpcurtis.medium.com/memorylayout-in-swift-c4e70bb32e3f](https://stevenpcurtis.medium.com/memorylayout-in-swift-c4e70bb32e3f)**

![](all_memory.png)

**Size**: It is the number of bytes required for that type in memory (padding included).

**Alignment**: size of the memory chunk so data type was read efficiently (equals to the largest basic type size stored in that type).

Always start at even addresses of memory [part abount mapping](part%20abount%20mapping)

```swift
public func printMemoryLayoutInfo<T>(_ item: T.Type) {
    print("Size: \(MemoryLayout<T>.size)")
    print("Stride: \(MemoryLayout<T>.stride)")
    print("Alignment: \(MemoryLayout<T>.alignment)")
}

struct A {
    let a: Int // 8 bytes
    let b: Bool // 1 bytes
}

struct B {
    let a: Int32 // 4 bytes
    let b: Bool // 1 bytes
}

// Size: 9
// Stride: 16
// Alignment: 8
printMemoryLayoutInfo(A.self) 

// Size: 5
// Stride: 8
// Alignment: 4
printMemoryLayoutInfo(B.self)
```

**Stride**: It tells about the distance between two chunks of data (padding included)

Calculating stride for example above:

A: alignment is 8 bytes so Int fits in one alignment marker but Bool is not, so we add (alignment - Bool) = 8 - 1 = 7 bytes so next item will be aligned In memory. Size of type is 9 bytes + 7 bytes == 16 == stride

**Examples**

**Value types**

```swift
struct Example {
    let foo: Int  // 8
    let bar: Bool // 1
}

print(MemoryLayout<Example>.size)      // 9
print(MemoryLayout<Example>.stride)    // 16
print(MemoryLayout<Example>.alignment) // 8
```

![](Computer%20Memory/All_memory.png)

```swift
struct Example {
    let bar: Bool // 1
    let foo: Int  // 8
}

print(MemoryLayout<Example>.size)      // 16 here because we need to add 7 bytes to bool to be aligned
print(MemoryLayout<Example>.stride)    // 16
print(MemoryLayout<Example>.alignment) // 8
```

![](Computer%20Memory/16_bytes_stride_(8x2).png)

**Reference types**

**Can’t use `MemoryLayout` because it will always return a machine word size**

```swift
class Test {
    var a: Int = 0
    var b: Int = 0
    var c: Int = 0
    var d: Int = 0
    var e: Int = 0
    var f: Int = 0
}
print(MemoryLayout<Test>.size) // 8
print(MemoryLayout<Test>.stride)  // 8
print(MemoryLayout<Int>.alignment) // 8
```

**6 bytes is reserved for metadata**

**Size of the class will always include**

```swift
class Empty {}
print(class_getInstanceSize(Empty.self)) // 16

class Example {
    let bar: Bool = true // 1 + 7 padding
    let foo: Int = 0     // 8
}
print(class_getInstanceSize(Example.self)) // 32 (16 + 16)
```

## Memory Layout

Each process has 4 gb (in case of 32bit systems) of virtual addresses in [virtual address space](virtual%20address%20space)

[Computer Memory/16_bytes_stride_(8x2) 1.png](Computer%20Memory/16_bytes_stride_(8x2)%201.png)

[https://gabrieletolomei.wordpress.com/miscellanea/operating-systems/in-memory-layout/](https://gabrieletolomei.wordpress.com/miscellanea/operating-systems/in-memory-layout/)

The stack and heap are traditionally located at opposite ends of the process's virtual address space. [Stack Hardware](Stack%20Hardware)

Kernel space

- Holds process meta-data for kernel like list of open files, mapped memory etc.

User space is separated onto **segments**

- **Stack**
    - If the stack pointer meets the **heap pointer** (or if it eventually reaches the limit posed by RLIMIT_STACK), there’s now free memory left.
- **Heap**
- **BSS (Block started by symbol)**
    - Uninitialized static variables are stored here
- **Data**
    - Divided onto read-only and read-write
    - Static constants and variables with initial value are stored here
- **Text**
    - Machine code of program located here
    

[Виртуальная память](Виртуальная%20память)

Виртуальная память aka Memory Swap - расширение адресного пространства RAM за счет использования жесткого диска (те делаем вид что оперативной памяти больше чем на самом деле). [Memory address resolving](Memory%20address%20resolving)

![](Computer%20Memory/OS_Kernel_Space.png)