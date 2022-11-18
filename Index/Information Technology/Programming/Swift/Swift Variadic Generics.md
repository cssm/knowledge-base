
```swift
func < (lhs: (), rhs: ()) -> Bool

func < <A, B>(lhs: (A, B), rhs: (A, B)) -> Bool where A: Comparable, B: Comparable

func < <A, B, C>(lhs: (A, B, C), rhs: (A, B, C)) -> Bool where A: Comparable, B: Comparable, C: Comparable

// and so on, up to 6-element tuples

// new sytax that allows to now write boilerplate above
func < <T...>(lhs: (T...), rhs: (T...)) -> Bool where T: Comparable
```

- [swift-evolution/variadic-generics.md at variadic-generics-vision · hborla/swift-evolution · GitHub](https://github.com/hborla/swift-evolution/blob/variadic-generics-vision/vision-documents/variadic-generics.md)