> Use witnesses instead of protocols if you can

- **Notes**
	- [Protocol Witnesses Advantages](Protocol%20Witnesses%20Advantages.md)
	- [Protocol Witnesses Limitations](Protocol%20Witnesses%20Limitations.md)
	- *Naming*
		```swift
		// Instead of
		protocol Diffable {	
		  func diff(old: Self, new: Self) -> String
		}

		// Do 
		struct Diffing<Value> {
		  let diff: (Value, Value) -> String
		}
		```
- **Links**
	- [Protocol Witnesses - Brandon Williams - App Builders 2019](https://www.youtube.com/watch?v=3BVkbWXcFS4)
