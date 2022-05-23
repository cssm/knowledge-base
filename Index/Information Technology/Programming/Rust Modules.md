- **Notes**
	- Crate - unit of compilation that defines root (unamed) module 
	- `crate::` - path to root module
	- `super::` - path to parent module
	```rust
	// here we in context of crate module
	mod my_module {
		// here we in context of `my_module` module
		pub fn public_fn() { println!("public") }
		// this will be unavailable if we import our library to another library
		pub(crate) fn public_in_create() {} 

		pub(self) fn self_private_fn() { println!("private") } // same as below
		fn private_fn() { println!("private") }
		
		mod nestes_module {
		  pub(super) fn super_f() {} // will be available in parent module 
		}
  	}
	my_module::public_fn(); // usage
	```