# Nominal and non-nominal types

## Nominal vs non-nominal

[What is a 'non-nominal type' in Swift?](https://stackoverflow.com/a/44396546/11282287)

`Nominal` - means "named"

- `Int`
- `Optional`
- etc.

`Non-nominal` types:

- Function types: `(Int) -> Void`
- [Tuples](Tuples.md) : `(Int, Int)`
- Metatypes: `String.Type` i.e. `String.self`
- [Existential](Existential.md) : e.g. `CustomStringConvertible & Error`
- `Void` (because it's a typealias to `()`)
- `Any`, `AnyObject`

`Non-nominal` types **can't:**

- be extended
- have methods
- have properties
- conform to protocols

## Why we can extend protocol when variable of it type is threaded as `non-nominal` type?

For example in this case:

```swift
extension CustomStringConvertible {}
```

we thread `CustomStringConvertible` as [Swift Protocols](Swift%20Protocols.md) but in this case:

```swift
let a: CustomStringConvertible
```

constant `a` here is an [Existential [Existential](Existential.md) not a [Swift Protocols](Swift%20Protocols.md)