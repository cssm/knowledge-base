- **Notes**
	- Good write about this topic in [Advanced Swift](../../../Books/Advanced%20Swift.md)
		```swift
		var a = [1, 2, 3]
		var b = a // no content copy
		b.append(4) // content copied to b

		fun a() rethrows // indicated that functions rethrows all exeptions that may happend in it to the caller
		```