- [What's the difference between protocol witness table and vtable in Swift? - Stack Overflow](https://stackoverflow.com/questions/56794554/whats-the-difference-between-protocol-witness-table-and-vtable-in-swift)
- **Static dispatch** - we now which function implementation to call at compile time
- **Dynamic dispatch** - decision on what function implementation to call will be made at runtime
- **Devirtualization** - when compiler try to staticly dispatch methods
- [Swift](Swift.md) uses virtual table and message dispatch to dynamically (in runtime) determinate witch method implementation to call. Message dispatch in contrast to virtual table allows to change itself in runtime (because of this we can swizzle methods)
- witness table is used in protocols instead of vtable (virtual table)
- `@inline` force static dispatch [Inlining in Swift](Inlining%20in%20Swift.md)
- Methods in extensions are staticly dispatched
	```swift
	protocol Kek {}

	extension Kek {
		func kek() {
			print("Kek")
		}
	}

	struct S: Kek {
		func kek() {
			print(String(reflecting: self))
		}
	}

	let kek: Kek = S()
	kek.kek() // Kek
	```
- How something is dispatched examples
	```swift
	protocol Noisy {
		func makeNoise() -> Int	// TABLE
	}
	extension Noisy {
		func makeNoise() -> Int { return 0 }	// TABLE
		func isAnnoying() -> Bool { return true }	// STATIC
	}
	class Animal: Noisy {
		func makeNoise() -> Int { return 1 }	// TABLE
		func isAnnoying() -> Bool { return false } // TABLE
		@objc func sleep() { }	// Still TABLE
		final func wow() {} // STATIC
	}
	extension Animal {
		func eat() { }	// STATIC
		@objc func getWild() { } // MESSAGE
	}
	
	```

