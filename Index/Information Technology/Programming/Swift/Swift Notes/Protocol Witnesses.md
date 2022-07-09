- **Notes**
	- *Use Cases*
		- When you do not want to create a new type but still want abstract something
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
