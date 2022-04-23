
- **Notes**
	- [UIViewPropertyAnimator](UIViewPropertyAnimator.md)
	- Basic animations
		```swift
		// instead of this
		UIView.animate(withDuration: 0.2) {
		  self.view.layoutIfNeeded()
		}
		// we can do this
		UIView.animate(withDuration: 0.2, delay: 0, options: .layoutSubviews) {
		  // constaints animation
		}
		```
- **Links**
	- [nathangitter/fluid-interfaces: Natural gestures and animations inspired by Apple's WWDC18 talk "Designing Fluid Interfaces"](https://github.com/nathangitter/fluid-interfaces)

## Animating contraints

If animating constraints (not frame sizes) we need to call `layoutIfNeeded()` for parent view (and we need to call it before starting animation, to be sure that all other view animations and changes did finished)

```swift
@IBAction func buttonTapped(_ sender: Any) {
		view.layoutIfNeeded()
		UIView.animate(withDuration: 2) {
				self.heighConstraint.constant = 250
				self.view.layoutIfNeeded()
		}
}
```

## UIView.animate()

```swift
UIView.animate(withDuration: 0.3) {
		button.center.x += 100
}
```

We can easily animate multiple things at once

```swift
UIView.animate(withDuration: 0.3) {
		button.center.x += 100
		button.frame.size.width = 200
}
```

By passing a completion closure, we’re able to react to when the animation was completed

```swift
UIView.animate(withDuration: 0.3, animations: {
		button.center.x += 100
		button.frame.size.width = 200
}, completion: { _ in
		button.backgroundColor = .red
})
```

Another overload with delay and curve

```swift
UIView.animate(
		withDuration: 0.3, 
		delay: 0.5, 
		options: .curveEaseInOut, 
		animations: {
				button.center.x += 100
        button.frame.size.width = 200
		}, completion: { _ in
        button.backgroundColor = .red
		}
)
```