> How to create my type for `String` or `&str`?

```rust
use std::str::FromStr;

struct MyType;

impl FromStr for MyType {
	type Err = String;
	fn from_str(s: &str) -> Result<Self, Self::Err> {
		Ok(MyType)
	}
}

pub fn main() {
	let _mt = MyType::from_str("string");
	// impelmenting FromStr allows to use parse method of String
	// https://doc.rust-lang.org/1.57.0/std/string/struct.String.html#method.parse
	let _mt1: Result<MyType, String> = "string".parse();
	// or using turbofish operator
	let _mt2 = "string".parse::<MyType>();
}
```