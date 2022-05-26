> trait == protocol == interface

- **Links**
	- [Sized. Size of the type need to be known at compile time](https://doc.rust-lang.org/stable/core/marker/trait.Sized.html)
		- When creating a generic something we implicitly get a `Sized` constraint on it. To get rid of this and use e.g. references add `T: ?Sized` as a constraint.
- **Notes**
	- traits in rust allows as to separate data (structs, enums) and it's behaviour (functions, methods)
	- [Rust Trait Objects](Rust%20Trait%20Objects.md)
	- [Rust Display](Rust%20Display.md)
	- [Rust FromStr](Rust%20FromStr.md)
	- [Rust PartialEq](Rust%20PartialEq.md)
	```rust
	trait A {
		// &self here indicates that a is a method, but self here is not mutable
		fn a(&self) { println!("a") }
		// also we can demand that self should be mutable to call method
		fn b(&mut self) { println!("b"); }
		// no self
		fn static_fn() { println!("Some static function"); }
	}
	
	struct B;
	impl A for B { }
	let b = B;
	b.a();
	B::static_fn(); // calling static function from trait
	```
