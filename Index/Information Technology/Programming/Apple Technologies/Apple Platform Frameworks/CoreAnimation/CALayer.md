- **Notes**
	- renders graphic on [GPU](../../../../Hardware/Components/GPU.md)
	- responds for how [UIView](../UIKit/UIView.md) looks (color, shape etc.)
	- it’s like [UIView](../UIKit/UIView.md)  but it **can’t take any events** neither touches or events from any system
	- **Every** [UIView](../UIKit/UIView.md) creates with build-in `CALayer` which we can access through `.layer` property
		- This layer is tightly coupled with view, so for example if we change `backgroundColor` of `layer ` -> we change background color of view
	- with `CALayer` you can do more complex stuff than with [UIView](../UIKit/UIView.md)
		- Make round borders	
		- Make shadow
		- Draw stroke around edges
	- `CALayer`'s of subview's are independent from parent layers
		- that means that if we add view `B` as subview on view `A`  and than add layer on `A` -> this layer will not effect view `B`
- **Links**
	- [CALayer Tutorial for iOS: Getting Started | raywenderlich.com](https://www.raywenderlich.com/10317653-calayer-tutorial-for-ios-getting-started)