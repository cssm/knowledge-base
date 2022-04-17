# Casting

```swift
// as! and as? performs casting at RUNTIME

let a = 4 as? Double // fails
let a = 4 as! Double // fails

// as performs casting at COMPILE TIME

let a = 4 as Double // ok cause here 4 is double literal not an Int
```