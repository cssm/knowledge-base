> "temporary share a value"

- We can do borrowing by using `references`
- At any moment of time you can one you do something with value you can have either a **one mutable reference** to it or **any number of immutable references** to it
```rust
fn main() {
  let mut str = String::from("Hi");
  borrow(&str); // function borrows value
  str.push_str("!");
  println!("{}", str);
}

fn borrow(string: &String) {
  println!("{}", string);
}
```
```rust
let mut a	= String::from("Hello");
{
	let r1 = &mut a;
	let r2 = &mut a; // error, only one mutable ref is allowed in scope to avoid data races
}
{
	let r1 = &a;
	let r2 = &a; // ok
	let r3 = &mut a; // error, r1 and r2 are not expecting string to be mutaed by r3
}
```