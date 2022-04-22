# Tuples

- A non-nominal type

```swift
// not named tupes
let tuple = (1, 2)
let one, two = tuple // unpacking

// named tuple
let tuple = (one: 1, two: 2) 
let one, two = tuple 
```

Tuples doesn't support desctucting in [Swift Closures](Swift%20Closures.md) parameters

```swift
let cl: ((Int, Int)) -> Void = { a, b in // error
	// code
}

let cl: ((Int, Int)) -> Void = { t in 
	let (a, b) = t
	// code
}
```