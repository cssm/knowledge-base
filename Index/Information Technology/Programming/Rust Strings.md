- **Links**
	- [String vs &str in Rust functions](https://hermanradtke.com/2015/05/03/string-vs-str-in-rust-functions.html/)
- **Notes**
	```rust
		pub fn strings() {
	  // &str - just a view for string data, NOT owning string data, we can change a string through it, layout [data_p:, length:]

	  // String - owns the string data, and data is dropped when the string is droped 
	  // (also contains capasity of string, while &str do not); layout [data_p:, length:, capasity:]

	  // `String literals` is statis strings that direcly embeded in binary
	  // string literal is &str tyle (actually &'static str)

	  let _s = "Hello\nWorld!"; 
	  let ds = String::from("Hello");
	  // to_owned will copy `s` to `new_s`
	  let new_s = ds.lines().next().unwrap().to_owned();
	  print!("{}", new_s); // ?we can't directly pring new_s, ?we need to wrap it in literal? why

	  fn print_me(msg: &str) { 
		println!("msg = {}", msg); 
	  }

	  let string = "hello world";
	  print_me(string);

	  let owned_string = String::from("hello world");
	  let borrowed_string = &owned_string; // type here is &String, &String == &str - implicit conversion that called "Deref coercion"
	  print_me(borrowed_string);
	}

	fn more_strings() {
	  fn string_slice(arg: &str) {
		println!("{}", arg);
	  }
	  fn string(arg: String) {
		println!("{}", arg);
	  }

	  string_slice("blue");
	  string_slice(&String::from("abc")[0..1]);
	  string_slice("  hello there ".trim());
	  string("red".to_string());
	  string(String::from("hi"));
	  string("rust is fun!".to_owned());
	  string("nice weather".into());
	  string(format!("Interpolation {}", "Station"));
	  string("Happy Monday!".to_string().replace("Mon", "Tues"));
	  string("mY sHiFt KeY iS sTiCkY".to_lowercase());
	}
	```
 