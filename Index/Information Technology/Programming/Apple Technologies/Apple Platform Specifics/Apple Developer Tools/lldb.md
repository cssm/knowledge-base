-  [Swift](../../../Swift.md) 
	```swift
	e -l Swift -- import UIKit // `--` here is a separator between lldb command and expression itself
	```
- *commands*
	```lldb
	thread return // return from current method 

	e // expression (alias to expr)

	p // alias to expr --

	po // alias to expr --0 --

	r // restart programm

	c // finish programm

	v // show varible from stack
	```
- *tricks*
	```lldb
	e var $a = "a" // creates variable in debugger
	```