- **Links**
	- [Graphical depiction of ownership and borrowing in Rust - Rufflewind's Scratchpad](https://rufflewind.com/2017-02-15/rust-move-copy-borrow)
- **Notes**
	- [Rust Borrowing](Rust%20Borrowing.md)
	- It's a type of memory management like garbage collection or manual memory management
	- Ownership is the responsibility of some piece of code to eventually cause a value to be destroyed
	- An ownership system is a set of rules or conventions for managing and transferring ownership
		- It's a set of rules that compiler check to verify that memory is managed correctly
	- Value can have only one owner (owner - variable that holds value)
	   ```rust
		// string - owner, String::from("Hi") - value
		let string = String::from("Hi");
		let string1 = srting; // another owner
		let string2 = &string; // not an owner (borrowing)
		``` 
	- Value never defines mutability/immutability, it's defined by owner of valu
		```rust
		let a = String::from("hello");
		let b = a;
		println!("{}", a); // ❌ error

		let a = 5;
		let b = a;
		println!("{}", a); // ✅ ok
		```
```rust
// _a - owner, immutable, created on stack
// 4 - value, immutable (iherited from owner), created on stack
let _a = 4;
_a += 1; // ❌ error
_a = 4; // ❌ error

// _a - owner, mutable, created on stack
// 4 - value, mutable (iherited from owner), created on stack
let mut _a = 5; // value, mutable, created on stack
_a += 1; // ✅ ok
_a = 6; // ✅ ok

// _s - owner, immutable, created on stack
// "Hello" - value, immutable (iherited from owner), created in heap
let _s = String::from("Hello");
_s.push_str(" World!"); // ❌ error
_s = String::from("Hello World!"); // ❌ error

// s - owner, mutable, created on stack
// "Hello" - value, mutable (iherited from owner), created in heap
let mut _s = String::from("Hello");
_s.push_str(" World!"); // ✅ ok
_s = String::from("Hello World!"); // ✅ ok

// _rf - reference (not value owner), immutable, created on stack
// lifetime is bounded to the owner (if _s gos out of scope - _rf is dead)
// and this rule is checked by rust compiler
let _rf = &_s;

fn main() {
  let _s = String::from("Hello!");
  let _rf = &_s;
  drop(_s); // ❌ error, cannot move out of `_s` because it is borrowed
  println!("{}", *_rf); // _rf is dead here
}
```
```rust
let a = "Hello";
let b = a; // creates on stack so cheep to copy
println!("{} {}", b, a); // ok
```
```rust
let a = String::from("Hello");
let b = a; // heap items uses move sematics so after this statement a is moved into b and a is no longer initilized
println!("{} {}", b, a); // error, a is not initilized 
```
```rust
// after assigning variable to another value we move ownership of this value
// same happens when we pass value to function
let a	= String::from("Hello");
something(a);
println!("{}", a); // error

fn something(str: String) {
	println!("{}", str);
}
```
```rust
// we can return a value from function to return an ownership
let a = String::from("Hello");
let b = something(a); // a drops here
println!("{}", b); // ok

fn something(str: String) -> String {
	println!("{}", str); 
	str
}
```
```rust
// but better solution is to use borrowing because they are not takes an ownership
let a	= String::from("Hello");
something(a);
println!("{}", a); // ok, references do not take an ownership

fn something(str: &String) {
	println!("{}", str); 
}
```