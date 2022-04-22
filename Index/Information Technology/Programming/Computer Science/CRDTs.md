> Conflict-Free Replicated Data Types

- **Notes**
	- Basic requirement is that we have some `merge` function 
	- Every CRDT should have this properties
		1.  *Commutativity*
			- Merging `A` into `B` should give the same result as merging `B` into `A`
		2. *[Idempotency](Idempotency.md)*
			- Say we have a network issue and we accidentally send a value multiple times. This should have the same result as merging the value once
		3. *Associativity*
			- If we have three instances of our app, it shouldn't matter whether we first merge `A` and `B` and then `C`, or if we first merge `B` and `C` and then `A`
- **Links**
	- [objcio/S01E294-crdts-introduction: Sample code for Swift Talk 294: CRDTs – Introduction](https://github.com/objcio/S01E294-crdts-introduction)
	- [Developing a Distributed Data App with SwiftUI and CRDTs](https://appdecentral.com/2020/11/03/developing-a-distributed-data-app-with-swiftui-and-crdts/)