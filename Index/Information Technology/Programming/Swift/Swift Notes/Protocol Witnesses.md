> Use witnesses instead of protocols if you can

- **Notes**
	- [Protocol Witnesses Advantages](Protocol%20Witnesses%20Advantages.md)
	- [Protocol Witnesses Limitations](Protocol%20Witnesses%20Limitations.md)
	- *Naming*
		```swift
		// Instead
		protocol Combinable {
		  func combine(_ other: Self) -> Self
		}
		
		// Do
		struct Combining<Value> {
		  let combine: (_ self: Value, _ other: Value) -> Value
		}
		```
- **Links**
	- [Protocol Witnesses - Brandon Williams - App Builders 2019](https://www.youtube.com/watch?v=3BVkbWXcFS4)
