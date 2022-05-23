- **Notes**
	- `Crate` - unit of compilation that defines root (unnamed) module 
		- Unit of compilation means that all used and nested modules are compiled too
		- Crate knows nothing about it's own name 
			```rust
			// foo.rs
			pub fn foo() { println!("FOO!"); }
			```
			```rust
			// bar.rs
			fn main() {
				module_name::foo(); // FOO!
			}
			```
			```shell
			rustc foo.rs --create-type rlib # compiling foo as rust library (.rlib) with name libfoo
			# here we passing module name to bar 
			rust bar.rs --extern module_name=./libfoo.rlib
			```
	- `crate::` - path to root module
	- `super::` - path to parent module
	```rust
	mod foo; // rust will lookup for `foo` crate

	// here we in context of crate module
	mod my_module {
		// here we in context of `my_module` module
		pub fn public_fn() { println!("public") }
		// this will be unavailable if we import our library to another library
		pub(crate) fn public_in_create() {} 

		fn private_fn() { println!("private") }
		pub(self) fn self_private_fn() { println!("private") } // same as above
		
		mod nestes_module {
		  pub(super) fn super_f() {} // will be available in parent module 
		}
  	}
	my_module::public_fn(); // usage
	```
	```rust
	struct Foo

	mod nested {
		type A = Foo // error.
		type B = crate::Foo // ok
		type C = super::Foo // ok
	}
	```
	- we can use [Rust Imports](Rust%20Imports.md) keyword `use` 
	```rust
	struct Foo
	struct Bar

	mod nested {
		use crate::{Foo, Bar}; // now we can use this types in this module
	}
	```