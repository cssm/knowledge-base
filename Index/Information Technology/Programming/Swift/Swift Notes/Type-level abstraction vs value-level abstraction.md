# Type-level abstraction vs value-level abstraction

For example in this case:

```swift
func bar<T: Collection>(x: T, y: T) -> [T] { ... }
```

`T` type here provides an `type-level abstraction` (or `generic constraint`) ****because `T` here will be compiled into concrete types

```swift
bar(x: 1, y: 2) // ok
bar(x: 1, y: "kek") // error
```

In other case `value-level abstraction` provided by [Existential [[Existential]] 's

```swift
protocol Kek { func lol() }

extension Int: Kek {
    func lol() { print("Int") }
}

extension String: Kek {
    func lol() { print("String") }
}

func bar(x: Kek, y: Kek) -> [Kek] { 
    return [x, y]
}

let wtf = bar(x: 1, y: "wow")
wtf.map { $0.lol() } // Int, String
```

Second example will not compile because Collection is generic protocol and it associated value can be latterly anything

```swift
func bar(x: Collection, y: Collection) -> [Collection] { ... } // error
```

Also we can't do this either:

```swift
let collection: Collection = [0, 1, 2]
```

Collection is a generic protocol and Swift can't resolve it for now (when writing this note Swift verion is `5.4`). This behiveour will change due to [Unlock existentials for all  proposal](https://github.com/apple/swift-evolution/blob/main/proposals/0309-unlock-existential-types-for-all-protocols.md).