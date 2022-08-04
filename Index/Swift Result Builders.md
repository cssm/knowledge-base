```swift
// declare a result builder
@resultBuilder
struct SimpleStringBuilder {
    static func buildBlock(_ parts: String...) -> String {
        parts.joined(separator: "\n")
    }
}

// use it like this
@SimpleStringBuilder 
func makeSentence3() -> String {
    "Why settle for a Duke"
    "when you can have"
    "a Prince?"
}
```
```swift
@resultBuilder
public struct ConfigurationBuilder<T> {
  public static func buildBlock(_ components: [T]...) -> [T] {
    return components.flatMap { $0 }
  }
  
  public static func buildExpression(_ expression: T) -> [T] {
    return [expression]
  }
  
  public static func buildOptional(_ component: [T]?) -> [T] {
    return component ?? []
  }
  
  public static func buildEither(first component: [T]) -> [T] {
    return component
  }
  
  public static func buildEither(second component: [T]) -> [T] {
    return component
  }
}
```

Input of result builder specified by `buildBlock` method

```swift
// can use when we need to convert one element of result builder of to some other type
static func buildExpression(_ expression: T) -> [T] { [expression] } 
```

Add `buildOptional` to use `if` statement in result builders

`buildEither(first:)` and `buildEither(second:)` to add support of `if-else if-else if`  and `switch`

Adding more relevant errors 

![](Swift%20Result%20builders/Untitled.png)

![](Swift%20Result%20builders/Untitled%201.png)

Basically result builder rewrites `switch` as a bunch of nested `if-else` statements. Same for the `else if`

```swift
let v0: Region
if userRegion != .eastAtlantic {
	if userRegion == .americas {
		v0 = .americas
	} else {
		v0 = .asiaPacifi
	}
} else {
	v0 = .eastAtlantic
}
```

[Write a DSL in Swift using result builders - WWDC21 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2021/10253/)