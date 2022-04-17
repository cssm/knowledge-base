# Pattern matching on custom type

```swift
struct Soldier {	
	let hp: Int
	let x: Int
	let y: Int

	static func ~= (pattern: Int, value: Soldier) -> Bool {
		return pattern == value.hp
	}
	
}
	
let soldier = Soldier(hp: 0, x: 0, y: 0)
switch soldier {
case 0: 
	print("Dead soldier")
default:
	break
}
```