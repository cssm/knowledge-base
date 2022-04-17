# Generics Specialisation

**Generic specialization** - optimisation of SIL which generates specialized versions of generic functions to use them directly. Specialization means to replace all usages of generics (in signature and in body of function) to specific type. This optimisation by default works only inside one module.

**Partial generics function is a function that have at least one generic parameter and the others are not.**

**mark your generic functions `@inlinable` to specialise it**

[[swift-users] inline best practices?](https://lists.swift.org/pipermail/swift-users/Week-of-Mon-20170227/004886.html)

This is needed because most of the time it’s not inlining you care about with generics, but being able to specialize the function body. ‣ 

When you using `@inlinable` compiler will specify your function but there's no guarantee that it will inline it 

[When should both @inlinable and @inline(__always) be used?](https://forums.swift.org/t/when-should-both-inlinable-and-inline-always-be-used/37375/5)

```swift
/// Sometimes you just really like Python
func len<T: Collection>(_ t: T) -> Int {
    return t.count
}
```

By default, if this was your whole program, Swift would not specialise this function: it would only emit the generic implementation.

```swift
/// Sometimes you just really like Python
@inlinable
func len<T: Collection>(_ t: T) -> Int {
    return t.count
}

func main() {
    print("The length of [1, 2, 3] is \(len([1, 2, 3]))")
}

main()
```

Now the behaviour of the Swift compiler changes. In addition to emitting the generic version, Swift will also emit a specialised version, specialised for Array<Int>.

When won't the compiler specialise?

1. When compiling for size using -Os (probably). Specialisation increases binary size as you get multiple implementations of the same function.
2. When not optimising at all. Specialisation is an optimisation.
3. When there is an optimisation boundary in the way. The most common boundary is a module boundary. Swift can do "whole-module" optimisation, but not "cross-module" optimisation.

Conveniently, there is a way to fix (3) if you don't care about ABI stability, which is to **mark your generic functions @inlinable**. SwiftNIO does this [extensively 6](https://github.com/apple/swift-nio/blob/5224cfbfd74f0ca4dc3b31dcd338a6fdf4904d80/Sources/NIO/CircularBuffer.swift#L18) on any part of our public API that is generic. If the function is @inlinable then the implementation of the function becomes visible to the compiler when it is compiling the module using the code, and that implementation is required in order to specialise the function. The result will be that the calling module will gain a specialised version of the function in its code, while the declaring module will only contain the generic function (and any specialisations that it uses itself).

I would strongly recommend against @_specialize. We have never gotten it to behave in a way we were really happy with in SwiftNIO. It works, but there are strange wrinkles around visibility that make it hard for callers to actually use the forcibly-specialised version. I recommend simply using @inlinable where it is appropriate, and trusting the compiler to sort everything else out.