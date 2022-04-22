**Monad** - something that have two operations: operation on turning pure type into monad and operation of sequencing monad's

![](Screenshot_2021-02-28_at_18.52.42.png)

Maybe monad in [Swift](../../Swift.md) is [Optionals](../../Swift/Swift%20Notes/Optionals.md) 

```swift
let a: Int? = 3 // return operation Int -> Optional<Int>
a.map { $0 == 3 ? false : true } // map operation Optional<Int> -> (Int -> Bool) -> Optional<Bool>
```
