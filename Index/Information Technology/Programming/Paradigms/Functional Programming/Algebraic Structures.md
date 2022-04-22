- **Notes**
	- Algebraic structure - anything that supports `map` and `flatMap`
	- Algebraic structure != Algebraic Data Type
	- There’s more to the specification though. Functor has two laws, as follows:
		1.  If $u$ is a functor, then calling $u.map(x => x)$ must be equivalent to $u$. This is the *identity law*.  
		2.  . If $u$ is a functor, and $f$ and $g$ are functions, then calling $u.map(x => f(g(x)))$ is equivalent to calling $u.map(g).map(f)$. This is the *composition law*.
	-If our class (or object) satisfies all these criteria, then we can call it a functor.
- **Links**
	- 
- *[JavaScript](../../JavaScript.md)*
	- [fantasyland/fantasy-land: Specification for interoperability of common algebraic structures in JavaScript](https://github.com/fantasyland/fantasy-land)