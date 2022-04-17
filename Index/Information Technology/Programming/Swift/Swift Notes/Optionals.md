# Optionals

You can’t use nil with non-optional constants and variables.

Swift’s nil isn’t the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil isn’t a pointer — it’s the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.

## Implicitly unwrapped optional

You can think of an implicitly unwrapped optional as giving permission for the optional to be unwrapped automatically whenever it’s used.

```swift
let assumedString: String! = "An implicitly unwrapped optional string."
```

## How to unwrap optional

```swift
let opt: Int? = 3

// 1
if let a = opt {
		print(a) // 3
}

// 2
guard let a = opt else { return }
print(a)

// 3
opt.map { print($0) } // 3
```

## Optional chaining

```swift
var a: Int? = 4
a?.description
```

Also due to this operator in swift we can do this:

```swift
var a: Int? = 4
a? += 1
print(a) // Optional(5)
```

## `nil` coalescing operator

```swift
let name: String? = nil
let unwrappedName = name ?? "Anonymous" 
```