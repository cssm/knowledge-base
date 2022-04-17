- Initialize dictionary
	```swift
	let dict1 = [1: "One", 2: "Two"]	
	let dict2 = [[Int  String]]
	let dict3 = Dictionary<Int, String>()

	let dict4: [Int: String] = [1: "One", 2: "Two"]
	let dict5: [[Int  String] = [Int  String]]
	let dict6: [Int: String] = [:]
	```
- Delete value
	```swift
	var d = [1: 1, 2: 2]
	d[1] = nil 
	print(d) // [2: 2]

	let v1 = d.removeValue(forKey: 2)
	print(v1) // Optional(2)
	print(d) // [:]
	```
- Update value
	```swift
	var d = [2: 2]
	let v = d.updateValue(3, forKey: 2)
	print(v) // Optional(2)
	print(d) // [2: 3]
	```
- Set initial value
	```swift
	var d = [String: Int]()
	d["a", default: 0] += 1
	print(d["a"]) // Optional(1)
	```