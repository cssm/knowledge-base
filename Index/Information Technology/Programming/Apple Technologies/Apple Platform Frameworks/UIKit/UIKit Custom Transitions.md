- **Links**
	- [Custom Navigation Transitions, Part I: An Introduction](https://devsign.co/notes/navigation-transitions-1)
- **Notes**
	1.  `UIViewControllerTransitioningDelegate` - any `NSObject` that manages different transitions (present, dismiss, etc.) between controllers.
		- if returned transition object is  `nil` -> [UIKit](../UIKit.md) uses default transition to present controller
	2. `UIViewControllerAnimatedTransitioning` - any `NSObject` that implements particular transition between controllers 
		- 