```swift
import Foundation

typealias Log = String
func measure(_ block: () -> Void) -> Log {
  let start = CFAbsoluteTimeGetCurrent()
  block()
  let end = CFAbsoluteTimeGetCurrent()
  return "Runned for \(end - start)s"
}

let log0 = measure {
  _ = (0...).lazy.map { "\($0)" }.prefix(3)
}
print(log0) // Runned for 0.0059670209884643555s

let log1 = measure {
  _ = (0...).map { "\($0)" }.prefix(3)
}
print(log1) // 🔴 never terminates

let log2 = measure {
  // allocation of array still happening so slower than above
  _ = Array(0...100000).lazy.map { "\($0)" }.prefix(3)
}
print(log2) // Runned for 0.05659306049346924s

let log3 = measure {
  _ = Array(0...100000).map { "\($0)" }.prefix(3)
}
print(log3) // Runned for 0.25000905990600586s
```


Struct needed to be created as `var` ****to use `lazy` ****cause accessing a `lazy` property is mutating operation because value only being initialised at it first access

> `lazy` is not thread safe 

```swift
struct Car {
	let name: String
    let material: String
    
    // should be var not let
    lazy var description = {
         // do a lot of complicated work
        return ...
    }()
}
```