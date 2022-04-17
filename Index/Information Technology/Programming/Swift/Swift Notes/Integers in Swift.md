`BinaryInteger` defines four strategies of conversion between integer types, each with different behaviors for handling out-of-range values:

Range-Checked Conversion - [init(_:)](https://developer.apple.com/documentation/swift/binaryinteger/2885704-init)

Trigger a runtime error for out-of-range values

Exact Conversion - [init?(exactly:)](https://developer.apple.com/documentation/swift/binaryinteger/2925955-init)

Return nil for out-of-range values

Clamping Conversion - [init(clamping:)](https://developer.apple.com/documentation/swift/binaryinteger/2886143-init)

Use the closest representable value for out-of-range values

Bit Pattern Conversion - [init(truncatingIfNeeded:)](https://developer.apple.com/documentation/swift/binaryinteger/2925529-init)

Truncate to the width of the target integer type

numericCast is like as! for integers initilization

```swift
let arrayOfNegativeInt: [Int] = [-1, -2, -3]
arrayOfNegativeInt.map(numericCast) as [UInt] // 🧞‍ Fatal error: Negative value is not representable

let arrayOfNegativeInt: [Int] = [-1, -2, -3]
arrayOfNegativeInt.map(UInt.init(exactly:)) // [nil, nil, nil]

import Darwin

func random(in range: Range<Int>) -> Int {
    return Int(arc4random_uniform(UInt32(range.count))) + range.lowerBound
}

// Gross 🤢 

import Darwin

func random(in range: Range<Int>) -> Int {
    return numericCast(arc4random_uniform(numericCast(range.count))) + range.lowerBound
}
```