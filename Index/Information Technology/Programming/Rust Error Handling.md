- **Links**
	- [miette. diagnostic library for Rust. It includes a series of traits/protocols that allow you to hook into its error reporting facilities, and even write your own error reports](https://docs.rs/miette/latest/miette/)
- **Notes**
	- Panic should be used to indicate that something bad happend and we now can be in indefined state
	- Panic to next things:
		1. stops execution of program
		2.  clears program stack
		3. exit program
	```rust
	panic!("Some error"); 
	```
	```rust
	let opt: Option<bool> = None;
	opt.expect("No bool!"); // try to get value or panic and provide message
	opt.unwrap(); // try to get value or panic
	if let Some(v) = opt {
		print(v)
	}
	```