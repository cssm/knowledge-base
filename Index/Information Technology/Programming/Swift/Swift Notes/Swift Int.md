- Optional init
	```swift
	// this init applies to all Int
	
	print(UInt8(exactly: -24)) // nil
	
	let v = 256
	print(UInt8(v)) // runtime error
	```
> `BinaryInteger` defines four strategies of conversion between integer types, each with different behaviours for handling out-of-range values

> numericCast is like as! for integers initilization
```swift
let arrayOfNegativeInt: [Int] = [-1, -2, -3]
arrayOfNegativeInt.map(numericCast) as [UInt] // 🧞‍ Fatal error: Negative value is not representable
```

```swift
import Darwin

func random(in range: Range<Int>) -> Int {
    Int(arc4random_uniform(UInt32(range.count))) + range.lowerBound
}

// Gross 🤢 

import Darwin

func random(in range: Range<Int>) -> Int {
	numericCast(arc4random_uniform(numericCast(range.count))) + range.lowerBound
}
```