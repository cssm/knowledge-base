# Errors, Exceptions, try

## Custom erorrs

```swift
struct CustomError: Error {}

print(CustomError().localizedDescription) // error

extension CustomError: LocalizedError {
    var errorDescription: String? { "lel" }
}
print(CustomError().localizedDescription) // lel
```

## `try` with Optionals in [Swift](Swift.md) 5

```swift
func foo() throws -> Int { 0 }
func foo() throws -> Int? { 1 }

let a = (try? foo())
let b = (try? foo())!

// Result in true, because staring from Swift 5 try? operator try’s to make optional nesting is less as possible (lowest bound starts from 1)
let result = (a == b)

// So result will be:
a = Optional(1)
b = 1
Optional(1) == 1 // true
```