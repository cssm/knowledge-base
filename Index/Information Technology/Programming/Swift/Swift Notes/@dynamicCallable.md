# @dynamicCallable

`@dynamicCallable`

Two options

```swift
@dynamicCallable
struct TelephoneExchange {
		// argument should conform to ExpressibleByArrayLiteral
    func dynamicallyCall(withArguments phoneNumber: [Int]) {
        if phoneNumber == [4, 1, 1] {
            print("Get Swift help on forums.swift.org")
        } else {
            print("Unrecognized number")
        }
    }
}

let dial = TelephoneExchange()

// Use a dynamic method call.
dial(4, 1, 1) // Prints "Get Swift help on forums.swift.org"
dial(8, 6, 7, 5, 3, 0, 9) // Prints "Unrecognized number"
dial.dynamicallyCall(withArguments: [4, 1, 1]) // Call the underlying method directly.
```

Also can use for `ExpressibleByDictionaryLiteral` values. Example with `KeyValuePairs`([https://developer.apple.com/documentation/swift/keyvaluepairs](https://developer.apple.com/documentation/swift/keyvaluepairs))

```swift
@dynamicCallable
struct Repeater {
		// should conform to the ExpressibleByDictionaryLiteral
    func dynamicallyCall(
				withKeywordArguments pairs: KeyValuePairs<String, Int>
		) -> String {
        return pairs
            .map { label, count in
                repeatElement(label, count: count).joined(separator: " ")
            }
            .joined(separator: "\n")
    }
}

let repeatLabels = Repeater()
print(repeatLabels(a: 1, b: 2, c: 3, b: 2, a: 1))
// a
// b b
// c c c
// b b
// a
```

[callAsFunction](callAsFunction.md) 

```swift
@dynamicCallable
struct A {
    func dynamicallyCall(withArguments phoneNumber: [Int]) {
        print("KEK")
    }
    
    func callAsFunction(_ withArguments: Int...) {
        print("LOL" )
    }
}

let a = A()
a(1, 3, 4) // calls callAsFunction
```