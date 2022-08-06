> [Functional Programming](Paradigms/Functional%20Programming.md)

- **Notes**
	```rust
	// reduce takes first element of iterator as accumulator
	pub fn fold_vs_reduce() {
	  let arr: Vec<i32> = vec![1, 2, 3];
	  let sum: Option<i32> = arr.iter().map(|v| *v).reduce(|a, b| a + b); 
	  let sum: i32 = arr.iter().fold(0, |acc, v| acc + v); 
	  let sum: i32 = arr.iter().sum();
	}
	```