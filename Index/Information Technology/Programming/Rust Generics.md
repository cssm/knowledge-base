- **Links**
	- 
- **Notes**
   ```rust
	// implementations for generics 
	impl<T> Point<T> {
		fn swap(&mut self) {
			std::mem::swap(&mut self.x, &mut self.y);
		}
	}
	```
	```rust
	trait Trait {}

	// These two are equivalent
	fn foo<T: Trait>(t: T)
	fn bar(t: impl Trait)
	```
	- But we can't use [Turbofish Operator](Turbofish%20Operator.md) with second one
	```rust
	foo::<u32>(0) // ok
	bar::<u32>(1) // error
	```