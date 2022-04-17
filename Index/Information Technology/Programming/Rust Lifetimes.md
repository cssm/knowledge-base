> But. That little `'a` says: "these things all live for the same span of time". We can assert that the original source code string lives at least as long as the tokens that reference it. By doing so, Rust can reason about whether or not those resulting token references are valid at a given point, and therefore doesn't have to assume them to be static! We can do whatever we want with those tokens and the compiler will guarantee that they always point to something valid, even if the source code is loaded in dynamically at runtime (from a file or otherwise). If we find out later via a compiler error that they really do need to outlive the source string, then we can copy them ("take ownership") at that point. If the compiler doesn't force us to do so, we know we're safe, and we know we can continue using the most efficient possible approach, fearlessly.

```rust
// here lifetime `'a` means that returned references can't outlive `s`
fn pair<'a>(s: &'a str, char: char) -> (&'a str, &'a str) {
	unimplemented!()
}
```

> If struct is borrowing a reference - lifetime always needed
```rust
// Here lifetime means that `Foo` struct can't outlive string that referenced in `bar`
struct Foo<'a> {
  bar: &'a str
}

let x = String::from("Bar");
let f = Foo { bar: &x };

// ❌
drop(x); // we can't drop x becouse with 'a we marked that reference to x should live as long as Foo lives
drop(f);

// ✅
drop(f);
drop(x);
```