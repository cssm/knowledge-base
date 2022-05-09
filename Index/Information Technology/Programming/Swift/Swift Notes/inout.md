- You can only pass a variable as the argument for an in-out parameter. You **cannot pass** a **constant** or a **literal** value as the argument, because constants and literals **cannot be modified.**
- In-out parameters cannot have default values, and variadic parameters cannot be marked as inout
	```swift
	var stepSize = 1  		
	func increment(_ number: inout Int) {
			number += 1
	}
	increment(&stepSize)
	print(stepSize) // 2
	```
- Placing the `inout` keyword before a parameter type in the function declaration gives the parameter a "copy-in copy-out" semantic (which may be optimized into "pass by mutable reference", but you shouldn't count on this).
    - When the function is called, the parameter is copied.
    - During the function call, the parameter is mutable and should be considered separate from the original value (although it may be optimized to be the same address in memory).
    - When the function returns, the parameter is copied back to caller, replacing the original value.