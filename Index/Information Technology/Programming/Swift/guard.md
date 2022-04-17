```swift
func some_func(v: String?) {
	// 🛑 check if nil using `if` adds nesting. bad
	if let v = v {
		print(v)
	}
	// ✅ cheking using guard. no nesting, sticking to ["happy path"(https://dimtion.fr/blog/tips-invert-conditions/)
	guard let s = v else { return }
	print(s)
}
```