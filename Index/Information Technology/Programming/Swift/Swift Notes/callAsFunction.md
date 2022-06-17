```swift
struct A {
    func callAsFunction(a: Int) {
        print(a)
    }
}

let a = A()
a(a: 34) // prints 34
```