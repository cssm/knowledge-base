- **Notes**
	- Swift compiler insets `release` after last use of the reference in the scope
		- This is called `Garanteed Object Lifetime` 
		- But with optimisations that might be used by compiler `release` operation can be inserted later and in real object life time a.k.a. `Observed Object Lifetime` can differ from `Garanteed Object Lifetime` so we can't rely on it
			- If object is created in function scope - it's common that `Observed Object Lifetime` is ends when function scope ends
		- From [Xcode 13](../../../Apple%20Technologies/Apple%20Platform%20Specifics/Apple%20Developer%20Tools/Xcode.md) we can enable `Optimize Object Lifetimes` to enable ARC lifetime shortening optimization (this will make `Observed Object Lifetime` equal to `Garanteed Object Lifetime` more consistently)
	 > Tip: instead of performing work in `deinit` with not owned objects make an assertion that this work will be completed
- **Links**
	- [ARC in Swift: Basics and beyond - WWDC21 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2021/10216/)