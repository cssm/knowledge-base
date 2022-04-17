# rethrows

```swift
import Foundation

// our rethrows function
func f(_ c: () throws -> Void) rethrows {
    try c()
}

// throwing function
let a: () throws -> Void = {
    try JSONDecoder().decode(String.self, from: Data())
}

// not throwing function
let b: () -> Void = {
    print("kek")
}

// ok, we can pass not throwing function to rethrows function and call it without try
f(b) 

// compile error, call can throw but is not marked with try (should be try f(a))
f(a)
```