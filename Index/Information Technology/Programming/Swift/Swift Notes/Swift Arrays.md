## General

```swift
let array1 = [1, 2, 3, 4]	
let array2 = [Int]()
let array3 = Array<Int>()
let array4: [Int] = []

array1[4] // exception
```

## reasign vs `removeAll()`

```swift
var arr = [1, 2, 3]
arr.removeAll() or arr = []
```

We should consider that at worst case they have **same performance**