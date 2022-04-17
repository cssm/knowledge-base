> Default parameters (like in [Swift](Swift.md)) is not supported in Rust

```rust
fn test() -> char {
  let string = "kek";
  string.chars().last().unwrap(); // ❌ error. function returning () due to ;
}

fn test() -> char {
  let string = "kek";
  string.chars().last().unwrap() // ✅ this code is ok. implicit return of last line if no ; 
}

fn test() -> char {
  let string = "kek";
  return string.chars().last().unwrap(); // ✅ this code is ok
}

// mutable parameter
fn test(mut str: String) {
	_ = str.pop();
}
```