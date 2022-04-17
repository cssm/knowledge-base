- **Notes**
	- Data is just array of bytes so we can represent it without depending on Foundation
		- [Supporting Foundation.Data Without Depending On It](https://duan.ca/2018/08/18/supporting-data-without-depending-on-it/)
	- [URLComponents](URLComponents.md)
	- [URLSession](URLSession.md)
	- [Date Formats](Date%20Formats.md)
- *Working with JSON*
	 ```swift
	// To get any JSON
	let jsonResponse = try JSONSerialization.jsonObject(
		with: dataResponse, options: []
	) 
	guard let jsonArray = jsonResponse as? [[String: Any]] else { return }
	print(jsonArray)
	```
	```swift
	// we can add CodingKeys enum to encode and decode ony some fileds
	struct SomeCodable: Codable {
		private let c: [Int] // not encoded by default
		let a: String
		let b: Int
	}

	// now only `a` property will be encoded
	extension SomeCodable {
		enum CodingKeys: CodingKey {
			case a	
		}
	}
	```