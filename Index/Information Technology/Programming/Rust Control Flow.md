```rust
// if also returning a value
let result: i32 = if true { 1 } else { 0 };

// if no else branch - expected type is unit
let result = if true { 1 }; // won't compile
let result = if true { () }; // ok
```