**Monad** - something that have two operations: operation on turning pure type into monad and operation of sequencing monad's

![[Functional Programming (FP)/Screenshot_2021-02-28_at_18.52.42.png]]

Maybe monad in [[Swift]] is [[Optionals]] 

```swift
let a: Int? = 3 // return operation Int -> Optional<Int>
a.map { $0 == 3 ? false : true } // map operation Optional<Int> -> (Int -> Bool) -> Optional<Bool>
```
