- **Notes**
	- `impl fmt::Display` for `MyType` to use `print!("{:?}", MyType())`
	```rust
	pub fn debug() {
		use std::fmt::Debug;
		
		let answer = 42;
		let message = "hello";
		let float = 2.7212;

		let display: Vec<&dyn Debug> = vec![&message, &answer, &float];

		for d in display {
			println!("got {:?}", d);
		}
	}
	```