> When a protocol is used as a type, that type is also known as an ***existential type***
> 

> An existential contains a value whose exact type has been abstracted away, but which is known to conform to a certain set of protocols

> Protocol types are only interchangeable with concrete types in limited ways. 
> - They don’t conform to protocols
> - you can’t create an instance with Bar()
> - you can't call static methods on Bar. 
> This kind of thing is why ‘any’ was introduced. ;-)

```swift
let a: CustomStringConvertible // existential type with constrains provided by CustomStringConvertible protocol

let b: Any // also an existential type with no constrains
```
- From [Swift](Swift.md) 5.6
	-  `var a: any Protocol`
	- Using `var a: Protocol` instead of `var a: any Protocol` *produces warning*. You can use an existential type alias to make that refactor a smaller diff. For example:
		```swift
		protocol BarProtocol { … }
		typealias Bar = any BarProtocol
		```
	- Then you can continue to use `Bar` in type position without `any`.
- Due to knowledge from [[Swift Metatypes]]  even that instance of type is erased to existntial, it's metatype ***still hold*** information about ***concreate meta type***
	```swift
	let kek = Kek()
	let lol: MyProtocol = kek
	print(type(of: lol) == Kek.self) // true
	```