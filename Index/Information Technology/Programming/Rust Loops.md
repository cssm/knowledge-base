```rust
loop { } // runs some code forever
while i < 10 { } // runs some code until condition is false
for el in array.iter() { } // to iterate over collection
```

```rust
let mut i = 0;
let value = loop {
  i += 1;
	if i == 2 { break i; }
};
println!("{}", value); // 2
```