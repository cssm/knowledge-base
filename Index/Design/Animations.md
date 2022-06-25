- **Links**
	- [(14) Advances in UIKit Animations and Transitions - Apple WWDC 2016 - YouTube](https://www.youtube.com/watch?v=jWckfDNUJVY)
		- Apple Photo's app like [UIKit Custom Transitions](../Information%20Technology/Programming/Apple%20Technologies/Apple%20Platform%20Frameworks/UIKit/UIKit%20Custom%20Transitions.md) + about [UIViewPropertyAnimator](../Information%20Technology/Programming/Apple%20Technologies/Apple%20Platform%20Frameworks/UIKit/UIViewPropertyAnimator.md)
	- [Damped Springs. Deep dive into math of animations](https://www.ryanjuckett.com/damped-springs/)
	- [Demystifying UIKit Spring Animations](https://medium.com/ios-os-x-development/demystifying-uikit-spring-animations-2bb868446773)
- **Notes**	
	- [UIKit Animations](../Information%20Technology/Programming/Apple%20Technologies/Apple%20Platform%20Frameworks/UIKit/UIKit%20Animations.md)
	```swift
	// UIScrollView default deceleration rate
	let decelerationRate = UIScrollView.DecelerationRate.normal
   ```
	- we can use `UIPropertyAnimator` to animate user interactive animations e.g. custom view controller transitions
	- we need always stop `UIPropertyAnimator` before object that holds it deinitilize