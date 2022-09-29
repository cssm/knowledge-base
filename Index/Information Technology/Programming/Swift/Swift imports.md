- [@_exported](Swift%20Notes/@_exported.md)
- [Swift Import Declarations - NSHipster](https://nshipster.com/import/)
	```swift
	// somewhere in module A
	struct B {}
	
	extension B {
		struct C {}
	}
	
	import struct A.B // ✅
	import struct A.B.C // 🔴 error
	```