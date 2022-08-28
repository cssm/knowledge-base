- **Links**
	- [Exposing Floating Point – Bartosz Ciechanowski](https://ciechanow.ski/exposing-floating-point/)
	- [Comparing Floating-Point Numbers Is Tricky](https://bitbashing.io/comparing-floats.html)
	- [Float Toy](http://evanw.github.io/float-toy/)
	- [floating point](https://wizardzines.com/comics/floating-point/)

```swift
// if comaring for equality 

let diff = abs(b - a)
let eps = 0.0000001 // epsilon

if diff <= eps {
	// eqal
}
```
