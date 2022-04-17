# Extensions

## Scope

```swift
// file0.swift
internal struct MyStruct {
	internal var myVar = 0

	internal func printMyVarState() {
		print(isMyVarZero) // ok
		print(isMyVarOne) // error, private access level
	}
}

private extension MyStruct {
	var isMyVarZero: Bool { myVar == 0 } 
}

---------------------

// file1.swift
private extension MyStruct {
	var isMyVarOne: Bool { myVar == 1 } 
}
```

## Stored Values

We can add stored property in extension by adding `objc_getAssociatedObject` and `objc_setAssociatedObject`

```swift
struct A {}

extension A {
	var a = 1 // error
	var meaningOfLife: String { String(42) }  // ok
}

extension A {
	static var a = 1 // ok
	static var staticMeaningOfLife: String { String(42) }  // ok
}
```