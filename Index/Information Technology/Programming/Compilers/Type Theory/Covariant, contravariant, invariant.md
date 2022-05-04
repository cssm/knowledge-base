- **Notes**
	- in [Swift](../../Swift.md)
		- Swift’s **built-in generic types are covariant**, which allows generic types to be sub-types of other generics. 
		- Generics are invariant for our custom types. This means that even if a generic type wraps a subtype, it doesn’t make it a subtype of a generic wrapping its super-type.
			```swift
			class A {}
			class B: A {}
			struct Wrap<T> { let item: T }

			var arr: Array<A> = Array<B>()
			let i: Wrap<A> = Wrap<B>(item: .init()) // error
			```
- **Links**
	- 

If A and B are types, f is a type transformation, and ≤ the subtype relation (i.e. A ≤ B means that A is a subtype of B), we have

- f is covariant if A ≤ B implies that f(A) ≤ f(B)
- f is contravariant if A ≤ B implies that f(B) ≤ f(A)
- f is invariant if neither of the above holds

More examples

```jsx
class Noun {}
class City extends Noun {}
class SanFrancisco extends City {}
```

## **Invariance**

```jsx
function method(value: Invariant<City>) {...}
method(new Noun());         // error...
method(new City());         // okay
method(new SanFrancisco()); // error...
```

Invariance **does not** accept **supertypes**.

Invariance **does not** accept **subtypes**.

## **Covariance**

```jsx
function method(value: Covariant<City>) {...}
method(new Noun());         // error...
method(new City());         // okay
method(new SanFrancisco()); // okay
```

Covariance **does not** accept **supertypes**.

Covariance **does** accept **subtypes**.

## **Contravariance**

```jsx
function method(value: Contravariant<City>) {...}
method(new Noun());         // okay
method(new City());         // okay
method(new SanFrancisco()); // error...
```

Contravariance **does** accept **supertypes**.

Contravariance **does not** accept **subtypes**.

## **Bivariance**

```jsx
function method(value: Bivariant<City>) {...}
method(new Noun());         // okay
method(new City());         // okay
method(new SanFrancisco()); // okay
```

Bivariance **does** accept **supertypes**.

Bivariance **does** accept **subtypes**.