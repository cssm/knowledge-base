> vector == dynamic array

```rust
let mut _dynamic_array = vec![1, 2, 3, 4]; // [data_p:, length:, capasity:] - owns the data
_dynamic_array.push(5);
let _slice = &_dynamic_array[0..2]; // reference to part of vector; [data_p:, length:] - do not owns the data
```