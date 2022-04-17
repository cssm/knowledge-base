## General

Closures store implicit strong reference to objects they're referencing 

```swift
let greetings1 = { (_ name: String) in
		print("Hello, \(name)")
}
greetings1("Me")
```

One of the main properties of closures, is that they can capture context where are they defined.

```swift
let closure: (_ number: Int) -> Void
```

## Nonescaping and `@escaping`

Swift assumes all closures are nonescaping by default

`@escaping` closures are allocated in heap → needs a ref count

If closure is not escaping swift **PROBABLY** will inline it

Optional closures are `@escaping` implicitly  (because they are stored in optional enum)

Closures come in two different variants - **escaping** and **non-escaping**. When a closure is **escaping** (as marked by the `@escaping` parameter attribute) **it means that it will be stored somehow (either as a property, or by being captured by another closure)**. 

## `@autoclosure`

Function should not take any parameters 

```swift
func printSome(_ text: () -> String) {
		print(text())
}

// Nah, not pretty
printSome({"Kek"})

func printSome(_ text: @autoclosure () -> String) {
		print(text())
}

// That's better 😎
printSome("Kek")

```