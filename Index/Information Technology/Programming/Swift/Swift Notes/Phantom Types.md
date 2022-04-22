- *[Swift](../../Swift.md)*
	- [pointfreeco/swift-tagged: 🏷 A wrapper type for safer, expressive code.](https://github.com/pointfreeco/swift-tagged)

> ***Phantom type*** - a generic type that is declared but never used inside a type where it is declared

```swift
// not using a phantom type
struct Vehicle<Type> {
	let name: String
	let type: Type
}

// using phantom type
struct Vehicle<Type> {
    let name: String
}
```

```swift
// Usage example

// enum here cause we can't create enum instance
enum Truck {}
enum Car {}

struct Vehicle<Type>: Equatable {
    let name: String
    
    static func magic(_ lhs: Self, _ rhs: Self) -> String {
        return lhs.name + rhs.name
    }
}

let truck = Vehicle<Truck>(name: "WobWob")
let car = Vehicle<Car>(name: "DabDab")
let car2 = Vehicle<Car>(name: "ZipPip")

print(Vehicle.magic(car, car2)) // ok
print(Vehicle.magic(car, truck)) // error
```