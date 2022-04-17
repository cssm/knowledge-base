```rust
// using `let binding` is a good way to implement `PartialEq` if we need to ignore some fields	
struct Big {
	field: u32,
	another: Vec<u8>,
	one_more: (i32, i32),
	irrelevant: String
}
impl PartialEq for Big {
	fn eq(&self, rhs: &Self) -> bool {
		let Self { field, another, one_more, irrelevant: _ } = self;
		*field == rhs.field && *another == rhs.another && *one_more == rhs.one_more
	}
}
```