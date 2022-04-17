- **Links**
	- [Damped Springs. Deep dive into math of animations](https://www.ryanjuckett.com/damped-springs/)
- *[iOS](iOS.md), [UIKit](UIKit.md)*
	- [Demystifying UIKit Spring Animations](https://medium.com/ios-os-x-development/demystifying-uikit-spring-animations-2bb868446773)

```swift
// UIScrollView default deceleration rate
let decelerationRate = UIScrollView.DecelerationRate.normal
```

- we can use `UIPropertyAnimator` to animate user interactive animations e.g. custom view controller transitions
- we need always stop `UIPropertyAnimator` before object that holds it deinitilize
- Use `UIInteraction` to implement