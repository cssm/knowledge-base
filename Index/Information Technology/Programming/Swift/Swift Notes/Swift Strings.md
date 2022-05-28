- **Links**
	- [Different ways to compare string in Swift | Sarunw](https://sarunw.com/posts/different-ways-to-compare-string-in-swift/)

![](photo_2021-12-16%2020.06.27.jpeg)

```swift
let string = "Hello, world!"

let secondIndex = string.index(after: string.startIndex)
let thirdIndex = string.index(string.startIndex, offsetBy: 2)
let lastIndex = string.index(before: string.endIndex)

print(string[secondIndex]) // e
print(string[thirdIndex]) // l
print(string[lastIndex]) // !
```

```swift
let substring: Substring = string[...]
```

Don't store substrings, because they store reference to original string and this can cause  **memory leak**

`Swift` uses cow principle on strings too

if we mutate a substring by appending something to it (i.e. operation that can't be performed by just moving pointer to the string) we force swift to mutate an original string 

Swift strings do some extra work with unicode scalars to resolve how to combine them in more representable way

```swift
// example
var flag = "🇺🇸"
flag.count // 1
flag.unicodeScalars.count // 2 this is becouse us flag is composed from two unicode scalars "U" and "A"

"🇺🇸".dropLast() // prints ""
"🇺🇸".unicodeScalars.dropLast() // prints "U"

let flag = "🇬🇧" // G B

print(flag.unicodeScalars.dropFirst().map(String.init)) // ["🇧"]
print(flag.utf8.dropFirst().map(String.init)) // ["159", "135", "172", "240", "159", "135", "167"]
```

`UnicodeScalar` still have some overhead to combine `utf8` symbols in unicode representable scalars so working with `UTF8View` is even better for performance, but we loose ability to work with some complicated scalars e.g. **emojis**

UnicodeScalar - up to 21 bits

UTF-16 - up to 16 bits

UTF-8 - up to 8 bits 

```swift
struct B {
    struct A {
        static var s: String { .init(reflecting: Self.self) } // File_name.B.A
        static var k: String { “\(Self.self)" } // A
    }
}
```

## StaticStings

Known at comilte time so has a low overhead of creating