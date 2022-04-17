- **Links**
	- [A Practical Intro to Macros in Rust 1.0](https://danielkeep.github.io/practical-intro-to-macros.html)
	- [The Little Book of Rust Macros](https://veykril.github.io/tlborm/introduction.html)
	- [Writing Non-Trivial Macros in Rust · Michael-F-Bryan](https://adventures.michaelfbryan.com/posts/non-trivial-macros/)
- **Notes**
	```rust
	print!("Hi!");

	println!("There");
	println!("{}", "There"); // regular print
	println!("{:?}", "There"); // debug print

	panic!("wow!"); // errors that should not be handled
	let vector = vec![1, 2, 3];
	```