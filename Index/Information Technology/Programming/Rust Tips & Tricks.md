- **Notes**
	- [Writing Ideomatic Rust](Rust/Writing%20Ideomatic%20Rust.md)
	- [Learning Rust](Learning%20Rust.md)
	- [Rust Variables Shadowing](Rust%20Variables%20Shadowing.md)
	- if we want to suppress compiler warning *that variable is not used*
		```rust
		let _i: i32 = 4;
		```
	- The compiler is capable of providing basic implementations for some traits via the `#[derive]`
	- only owned types in fields of your own types, always return owned values unless you're passing through directly from a function argument, clone liberally, derive(Copy) when possible, use Arc/RefCell to unblock.
	-  `_` - placeholder for type
		-  `(_, _)` - tuple with types that should be inferred, 
	- `..` - ignore parts in match expression
		-  `(v, .., c)` - match only first and last element of tuple and ignore rest
	```rust
	// constant declaration
	const SOME_VAR: i32 = 3
	```
- **Links**
	- [Cheat Sheet](https://cheats.rs/)
	- [Cooking in Rust. Rust Snippets](https://rust-lang-nursery.github.io/rust-cookbook/intro.html)