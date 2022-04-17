- **Notes**
	- Comparing Metatypes
		```swift
		protocol Bark {}
		struct A: Bark {}
		struct B: Bark {}
		struct C: Bark {}

		print([A.self, B.self].contains(B.self)) // error
		print([A.self, B.self].contains { $0 == B.self })
		```

## Metatype vs Type

Metatype is a type of the type

```swift
// here Hello is an instance of type String
let string: String = "Hello"

print(string) // "Hello"
print(type(of: string)) // String

// here String.self is an instance of metatype String.Type
let stringType: String.Type = String.self 

print(stringType) // String
print(type(of: stringType)) // String.Type
```

```swift
class A {}
class B: A {}

let a: A.Type = B.self // ok
```

## Compile time type vs Dynamic type

`String.self` - compile time type

`type(of:)` - dynamic type

```swift
// Compile time type of myNum is Any, but the runtime type is Int.
let myNum: Any = 1 
type(of: myNum) // Int
```

## Protocol metatypes

They are not like regular types metatypes

```swift
protocol MyProtocol {}
let metatype: MyProtocol.Type = MyProtocol.self // error
```

Error above is accuring becouse `MyProtocol.Type` refering to a metatype of type that implementing that protocol

```swift
protocol MyProtocol {}
struct Kek: MyProtocol {}
let metatype: MyProtocol.Type = Kek.self // ok
```

```swift
let protMetatype: MyProtocol.Protocol = MyProtocol.self
```

## References

[What's .self, .Type and .Protocol? Understanding Swift Metatypes](https://swiftrocks.com/whats-type-and-self-swift-metatypes)