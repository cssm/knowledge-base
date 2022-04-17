- **Links**
	- [Swift Style Guide](https://google.github.io/swift/)
	- [raywenderlich/swift-style-guide: The official Swift style guide for raywenderlich.com.](https://github.com/raywenderlich/swift-style-guide)

## General

Most of guidelines is provided by using personal [[swiftlint]]  and `swift-format` configuration

Tab is 2 spaces

## Control Flow Statements

```swift
// ✅
if stuff {
	doStuff()
}

// 🛑
if stuff { doStuff() } 
```

## Naming

### [[Swift Enums]]

If enum is used for namespacing - use plural name e.g.

```swift
enum Deeplinks {
	struct Universal {}
	struct URLSchema {}
}
```

In other cases use singular

```swift
enum State {
	case idle
	case loading
}
```