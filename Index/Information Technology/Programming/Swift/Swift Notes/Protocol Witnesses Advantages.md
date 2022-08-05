- Allows namespacing

```swift
enum MyDomain {}

extension MyDomain {
	// 🔴 error. 
	protocol MyProtocol {
		func call()
	} 
}

extension MyDomain {
	struct MyWitness {
		let call: () -> Void
	}
}

```

- You do not need to create new types to use abstraction
- As bonus you get dot-notation for free and you no longer need to search which types are conforming to the protocol 

```swift
// Without protocol witnesses 😡
protocol MyProtocol {
  func call()
}

struct FailingMyProtooclImpl: MyProtocol {
  func call() {
    fatalError("Failing")
  }
}

struct EmptyMyProtocolImpl: MyProtocol {
  func call() {}
}

func useMyProtocolImpl(_ impl: MyProtocol) {
  impl.call()
}

useMyProtocolImpl(EmptyMyProtocolImpl())
useMyProtocolImpl(FailingMyProtooclImpl())

// Needs a new type declaration 😡
struct NotFlexible: MyProtocol { 
  func call() { print("NOT Flexible 😡") }
}

useMyProtocolImpl(NotFlexible())

// With protocol witnesess 🥺
struct MyWitness {
  let call: () -> Void
}

extension MyWitness {
    static var failing: Self {
      Self { fatalError("Failing") } 
    }
    
    static var empty: Self {
      Self {}
    }
}

func useWitness(_ witness: MyWitness) {
  witness.call()
}

// compiler helps us here by showing all implementations 
useWitness(.empty)
useWitness(.failing)
// No new type needed 
useWitness(.init { print("Flexible 🥺") })
```

- A more clear semantics
	- If you want copy semantics declare your witness as `struct`
	- If you want reference semantics declare your witness as `class`
	- In case of protocols event if you have a class under the hood you still can get a copy semantics. Check [swift protocols has value semantics by default](Swift%20Protocols.md#Has_value_semantics_by_default) for example