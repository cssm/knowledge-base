## General

**@inline** is used for internal inlining (in one module)

When the hell is doing this a good idea? According to the Apple engineers, the answer is **basically never.**

**@inlinable** is used for inlining methods when they will be used in another module (method implementation becomes a part of public interface of module i.e. body of function is added to module interface).

if **@inlinable** method is calling some internal method this method should be marked with `@inlinable` too or with `@usableFromInline`

advantages:

- you can boost up performance of using your methods from another module

disadvantages:

- increasing binary size
- changes API of module
    - can’t use updated implementation of method without recompiling module that uses that method

## `@inlinable` vs `@inline(__always)`

- `@inlinable` is about visibility of functions body outside it's module
- `@inline(__always)` is about
    - Not changing module API
    - Consider not using `@inline(__always)` in general
        - It may be useful in cases where you're sure that this will increase performance
- Use `@inlinable` only for [Generics [Generics Specialisation in Swift](Generics%20Specialisation%20in%20Swift.md)

a function that is @inline(__always), but not @inlinable, will not be available for inlining outside of its module, because the function body that would be inlined is not available.

[When should both @inlinable and @inline(__always) be used?](https://forums.swift.org/t/when-should-both-inlinable-and-inline-always-be-used/37375/2)

[https://twitter.com/stephentyrone/status/1420741000314691586?s=20](https://twitter.com/stephentyrone/status/1420741000314691586?s=20)

## `@usableFromInline`

Apply **@usableFromInline** attribute to a function, method, computed property, subscript, initializer, or deinitializer declaration to allow that symbol to be used in inlinable code that’s defined in the same module as the declaration. The declaration must have the **internal** access level modifier.

Like the public access level modifier, this attribute exposes the declaration as part of the module’s public interface. Unlike public, the compiler doesn’t allow declarations marked with usableFromInline to be referenced by name in code outside the module, even though the declaration’s symbol is exported. However, code outside the module might still be able to interact with the declaration’s symbol by using runtime behavior.

```swift
// ✅
struct A {
    private var a = [[Int]]
    
    @usableFromInline 
    mutating func fa() {
        a.append(1)
    }
}

// 🛑
struct A {
    @usableFromInline
    private var a = [[Int]]
    
    mutating func fa() {
        a.append(1)
    }
}
```

## Example

```swift
public struct A {
    private var a = [[Int]]
    
    @usableFromInline // attributed exposes this method signature as part of public API
    mutating func fa() {
        a.append(1) // can access private stuff becouse body not exposed
    }
    
    @inlinable
    public mutating func la() {
        fa() // decared that body of function should be part of module public API, so fa() needs to be inlinable or usableFromInline
    }
}
```