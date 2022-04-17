# When [weak self]

```swift
// in ViewController
let someClosure = { 
		self.doStuff() // self is captured here ! retain cycle 
}

let someClosure = { [weak self] in
		// temporary reference that will be destroyed after leaving scope
		guard let self = self else { return } 
		self.doStuff() // no retain cycles
}
```

![[when_weak_self.png]]