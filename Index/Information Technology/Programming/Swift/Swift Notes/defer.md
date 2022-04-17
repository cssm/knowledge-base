# defer

```swift
func show(_ stuff: Any) {
    defer { print("return") }
    print(stuff)
}

show(3) 
// 3
// return
```

```swift
// 0 ... 10
for i in 0 ... 10 {
    defer { print(i) }
    if i.isMultiple(of: 2) {
        continue
    }
}
```