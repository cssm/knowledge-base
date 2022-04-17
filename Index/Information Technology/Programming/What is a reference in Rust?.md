- **Notes**
	- `&[T]` is erased  `Vec<T>` (heap) or `[T]`  (stack)
		- that's why we can easily convert `Vec<T>` to `&[T]` (using `as_ref()`) but can't convert `&[T]` to `Vec<T>`
	- `&T` is erased `Box<T>`(heap) or `T` (stack)
	```rust
	let mut v: i32 = 3;
	let rv = &mut v;
	*rv += 1;
	println!("{}", rv); // 4
	println!("{}", v); // 4
	```
- **Links**
	- [What's a reference in Rust?](https://jvns.ca/blog/2017/11/27/rust-ref/)