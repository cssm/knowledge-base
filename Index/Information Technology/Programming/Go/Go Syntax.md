# Go Syntax

## Exported names

In Go, a name is **exported** if it **begins with a capital letter**. For example, `Pizza` is an exported name, as is `Pi`, which is exported from the math package.

## Structs

```go
type Vertex struct {
		X, Y int 
}
```

Struct fields can be accessed through a `struct pointer`.

To access the field `X` of a struct when we have the struct `pointer p` we could write `(*p).X`. However, that notation is cumbersome, so the language permits us instead to write just ****`p.X`, without the explicit dereference.

```go
// s**tructs have value semantics**

p := Vertex{}
d := p
d.X = 4
fmt.Println(p, d) // {0, 0}, {4, 0}

p := Vertex{}
d := &p
d.X = 4
fmt.Println(p, d) // {4, 0}, {4, 0}
```

## Switch

Switch without a condition is the same as switch true.

This construct can be a clean way to write long if-then-else chains.

```go
t := time.Now()
switch {
case t.Hour() < 12:
		fmt.Println("Good morning!")
case t.Hour() < 17:
		fmt.Println("Good afternoon.")
default:
		fmt.Println("Good evening.")
}
```