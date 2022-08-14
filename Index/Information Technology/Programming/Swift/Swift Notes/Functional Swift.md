
- **Notes**
	- `map` vs `flatMap`
		```swift
		let uuid: String? = UUID().uuidString
	
		// UUID.init is optional
		let r1 = uuid.map(UUID.init) // Optional(Optional(36A25A4E-65C3-42D9-978D-44393463408D))
		let r2 = uuid.flatMap(UUID.init) // Optional(36A25A4E-65C3-42D9-978D-44393463408D)
		```
- **Links**
	- [Functional Swift - YouTube](https://www.youtube.com/channel/UCNFUO_7gsLBk4YTmZoSTk5g)