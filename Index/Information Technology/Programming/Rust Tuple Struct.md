```rust
struct Point(u32, u32);

fn main() {
  let point = Point(0, 1);
  print!("{}", point.0); // 0
	let Point(x, y) = point; // destructing into x and y;
	println!("x: {}, y: {}", x, y);
}
```