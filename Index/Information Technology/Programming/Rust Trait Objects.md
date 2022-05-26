- **Links**
	- [dyn - Rust](https://doc.rust-lang.org/std/keyword.dyn.html)
- **Notes**
	```rust
	// &dyn - trait object, also here to show that calls to methods are dynamicly dispatched
	let a: &dyn A = &b; // erase to A
	```