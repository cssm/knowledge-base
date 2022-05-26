```rust
  use std::collections::HashMap;

  fn print_map(map: &HashMap<&str, i32>) {
    for (&k, v) in map.iter() {
      println!("`{}` : {}", k, v);
    }
  }
  
  fn print_int(int: &i32) {
    println!("{}", int);
  }

  // HashMap is owning it's keys and values

  // hashmap lives only in the scope of function, so we can use &str as key here
  // because it's lifetime is guaranteed here, but if it was declared in another scope
  // we need to allocate String
  let mut map = HashMap::new();
  let key = "key";
  map.insert(key, 1);
  
  let mut i1 = map[key]; // copy item and panic if no key, value still in hashmap
  i1 += 1;
  print_int(&i1); // 2
  print_map(&map); // `key` : 1

  let i2 = map.get(key).unwrap(); // get immutable reference to item, value still in hashmap
  // i2 += 1; // error
  print_int(i2); // 1
  print_map(&map);  // `key` : 1

  let i4 = map.get_mut(key).unwrap(); // get mutable reference to item, value still in hashmap
  *i4 += 1; // here we can mutate item in hashmap
  print_int(i4); // 2
  print_map(&map); // `key` : 2

  let mut i3 = map.remove(key).unwrap(); // get item, value removed from hashmap
  i3 += 1;
  print_int(&i3); // 3
  print_map(&map); // `empty`
```