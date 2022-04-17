## Functors

**Functors** - thing that allows us not to operate with a **Type** but with `Box<Type>` like with just `Type`

Example:

```swift
let a: Int? = 4

// if a has value than acts with that value else return nil
// (5 + (4 + (3 + a)))
a.map { $0 + 3 }.map { $0 + 4 }.map { $0 + 5 } // returns Int? (Box<Type>)
```
