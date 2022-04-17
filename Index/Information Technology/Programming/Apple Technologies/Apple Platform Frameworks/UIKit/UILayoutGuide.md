# UILayoutGuide

Defines a rectangular area (like a dummy view but not a view) 

## Example

```swift
func make() -> UIView {
	let v = UIView()
	v.backgroundColor = .green
	let l = UILayoutGuide()
	// inversed logic: we adding container on a view, not view on a container
	v.addLayoutGuide(l)
	// configuring container constraints
	l.snp.makeConstraints { make in
		make.height.width.equalTo(50)
		make.center.equalToSuperview()
	}
	return v
}

view.backgroundColor = .red
let v = make()
view.addSubview(v)
v.snp.makeConstraints { make in
	make.height.width.equalTo(25)
	make.center.equalToSuperview()
}
```

![[UILayoutGuide/Screenshot_2021-03-23_at_21.32.31.png]]

`UILayoutGuide` result