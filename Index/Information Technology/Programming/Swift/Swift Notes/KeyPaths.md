# KeyPaths

> `KeyPath` - reference to some property of `struct`/`class`

- Also there some implementations of `CasePath` - reference to [[Swift Enums]] case
	- [pointfreeco/swift-case-paths: 🧰 Case paths bring the power and ergonomics of key paths to enums!](https://github.com/pointfreeco/swift-case-paths)
- Use `ReferenceKeyPath` for reference types
	- You can gain some painful crashes especially when using `WritableKeyPath`  instead of `ReferenceWritableKeyPath`
-  `KeyPath` and [[Swift Closures]] are **same**
	-  `KeyPath` can be implicitly converted to closure, but no vice versa (check code examples below)

## Examples

```swift
struct Anime {
	let name: String
}

let keyPathClosure: (Anime) -> String = { $0.name }

let keyPath: KeyPath<Anime, String> = \.name

let anime = Anime(name: "Attack on Titans")

print(keyPathClosure(anime)) // Attack on Titans
print(anime[keyPath: keyPath]) // Attack on Titans
```
```swift
let anime = [
	Anime(name: "Naruto"), 
	Anime(name: "Attack on Titans"), 
	Anime(name: "Death Note")
]

print(anime.map(\.name) == anime.map { $0.name }) // true
```
```swift
func getStringProperty<T>(
    from item: T,
    _ closure: (T) -> String
) -> String {
    return closure(item)
}

let anime = Anime(name: "Attack on Titans")

let cl: (Anime) -> String = { $0.name }
let kpth: KeyPath<Anime, String> = \.name

print(getStringProperty(from: anime, \.name)) // Attack on Titans
print(getStringProperty(from: anime, cl)) // Attack on Titans

func getStringProperty<T>(
  from item: T,
	_ keyPath: KeyPath<T, String>
) -> String {
    return item[keyPath: keyPath]
}

print(getStringProperty(from: anime, \.name)) // Attack on Titans
print(getStringProperty(from: anime, cl)) // 🛑 error
```
