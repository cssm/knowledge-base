```rust
enum Lol {
  Kek,
  Struct { x: i32, y: i32 } // anonymus struct as associative value
}
let _anon = Lol::Struct { x: 1, y: 2 };
  // match is returning value
  let _result: () = match _anon {
  Lol::Kek => print!("Kek"),
  Lol::Struct { x, y } => print!("{}, {}", x, y)
};
```