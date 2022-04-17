- Types that perform deep copies are said to have **value semantics**.
- closure expression - `var a = {}`
- *Closure* - something that captures variables from outer scope
- *Methods* - has an implicit `self` param
- *CoW (Copy on Write)* 
	```swift
	var a = [1, 2, 3]
	var b = a // no content copy
	b.append(4) // content copied to b

	fun a() rethrows - indicated that functions rethrows all exeptions that may happend in it to the caller
	```