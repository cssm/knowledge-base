# @dynamicMemberLookup

```swift
@dynamicMemberLookup
struct Kek<T> {
    let val: T
    init(_ val: T) {
        self.val = val
    }
    subscript<V>(dynamicMember keyPath: KeyPath<T, V>) -> V {
        val[keyPath: keyPath]
    }
}

let label = UILabel()
label.text = "kek"
let a = Kek(label)
print(a.text) // kek
```