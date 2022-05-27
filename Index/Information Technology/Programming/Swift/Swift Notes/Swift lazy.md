Struct needed to be created as `var` ****to use `lazy` ****cause accessing a `lazy` property is mutating operation because value only being initialized at it first access

`lazy` is not thread safe 

```swift
struct Car {
		let name: String
    let material: String
    
    // should be var not let
    lazy var description = {
            // do a lot of complicated work
            return ...
    }()
}
```