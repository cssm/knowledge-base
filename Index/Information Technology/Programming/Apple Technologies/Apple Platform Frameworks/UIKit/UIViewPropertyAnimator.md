## UIViewPropertyAnimator

Gives us a greater degree of control over the produced animation

```swift
let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
		button.center.x += 100
		button.frame.size.width = 200
}
```

One benefit of property animators is that it’s quite simple to modify an animation before it has started

```swift
if viewHasAdditionalContent {
        // Animations added this way will be performed alongside
        // the animator's original animations (a delay can optionally
        // be applied as well).
        animator.addAnimations {
            buttonB.center.y += 100
        }
}
```

Property animations don't start immediatly, instead, we’re in control of exactly when to start it

`animator.startAnimation()`

We can even pause an animation while it’s in progress — which can be really useful if the user is deciding whether to cancel an action, or if we’re building some form of interactive animation

`animator.pauseAnimation()`

To resume the animation again, we simply make another call to `startAnimation`.