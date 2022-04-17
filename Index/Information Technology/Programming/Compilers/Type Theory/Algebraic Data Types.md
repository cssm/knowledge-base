- Type - number of possible values combinations
	- `Bool` type has 2 possible values `true` and `false`
- An algebraic data type is a structured type that’s formed by composing other types. Or, even shorter, it’s a type made of other types.
- Product algebraic types
	- 
	```swift
	// Possible number of values is 256 * 2 so because of this it's called a product type
	struct WorkDay {
		let numberOfClients: UInt8
		let isWorkingDay: Bool
	}
	```
- Sum algebraic type
	- Possible number of values is equal to 4 because enum can take only one from 4 values.
	```swift
	enum Direction {
		case north
		case south
		case east
		case west
	}
	```
	- If case have an associated value then that case will add to sum a value equal to  combination of type in associated case i.e.
	```swift
	// possible number of values in 1 + 256 = 257
	enum A {
		case L
		case R(UInt8)
	}
	```
      

**Recursion Types**

Besides _sum_ and _product_, another common class of algebraic type is recursion types. The interesting bit here is that Swift struggles to support it. In WWDC 2015, it was announced that enums can be defined recursively in Swift 2:

```swift
indirect enum Tree {
	case Empty
	case Node(Tree, Tree)
}
```
- Isomorphic types
	- if we have an enum Zero {} and enum Add<T, U>, then types Add<T, Zero> and T are isomorphic