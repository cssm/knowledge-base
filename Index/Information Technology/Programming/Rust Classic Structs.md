```rust
struct Car {
  model: String,
  year: u32
}

fn main() {
  let car = Car {
    model: String::from("Volvo"),
    year: 1999
  };
	// ✅ we don't have to preserve the order of fields
	let car1 = Car {
    year: 1999,
    model: String::from("Volvo1")
  };
  print!("Car: {} - {}", car.model, car.year); // Car: Volvo - 1999
}
```

```rust
struct User {
	active: bool,
	username: String,
	email: String
}

fn main() {
	let user = User {
		active: true,
		username: String::from("goblinn"),
		email: String::from("cool45akol@gmail.com")
	};
	// creating new user based on old value
	let user1 = User {
		email: String::from("my_new_email@email.com"),
		..user // can use ony at the end of struct
	};
}
```