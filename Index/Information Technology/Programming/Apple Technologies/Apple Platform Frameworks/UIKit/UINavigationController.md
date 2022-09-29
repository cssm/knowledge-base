- **Links**
	- [Navigation Bar Customisation. Part 1 - The Basics.](https://dmtopolog.com/navigation-bar-customization/)
	- [Navigation Bar Customisation. Part 2 - UINavigationBarAppearance and proper view/model separation.](https://dmtopolog.com/navigation-bar-customisation-2/)
	- [Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uinavigationcontroller/customizing_your_app_s_navigation_bar)
	- [How to make good looking large titles](https://twitter.com/katleta3000/status/1259400743771156480)
	- [TN3106: Customizing the appearance of UINavigationBar | Apple Developer Documentation](https://developer.apple.com/documentation/technotes/tn3106-customizing-uinavigationbar-appearance)
	- [Customizing Your App’s Navigation Bar | Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uinavigationcontroller/customizing_your_app_s_navigation_bar)
	- *Transparent Navigation Bar*
		- [How to make a transparent navigation bar in iOS | Sarunw](https://sarunw.com/posts/how-to-make-transparent-navigation-bar-in-ios/)
	- *Back Button*
		- [How to change a back button image | Sarunw](https://sarunw.com/posts/how-to-change-back-button-image/)
		- [How to remove back button titles | Sarunw](https://sarunw.com/posts/what-should-you-know-about-navigation-history-stack-in-ios14/)
		- [A new way to manage the back button title in iOS 14 with backButtonDisplayMode | Sarunw](https://sarunw.com/posts/new-way-to-manage-back-button-title-in-ios14/)
		- Hide Back Button
			```swift
			navigationItem.setHidesBackButton(true, animated: false)
			```


- Disable/enable swipe pop gesture
	```swift
	 navigationController.interactivePopGestureRecognizer?.isEnabled = .random()
	```

## General

> Specifically `navigationItem` is the view controller’s property which contains the model for a navigation bar. It contains the title (which by default reflects the view controller’s `title`)
> 

```swift
let fc = UIViewController()
let nav = UINavigationController(rootViewController: fc)
```

`pop()` - pops to previos controller in stack or to specified

`navigationController` - variable that helpsany controller to communicate wieh `UINavigationController` (if any exists)

`navigationBar`(`UINavigationBar`) - handels appeareance 

`navigationBarItem`(`UINavigationItem`) - handles items (buttons, back button etc.) in `UINavigationController` navigation bar

## Overriding behavior

We can do this by setting `delegate` object that will handle behavior of controller

This object should confirm to `UINavigationControllerDelegate` protocol

## Remove line under **`UINavigationBar`**

```swift
func removeLineUnderNaviagtionBar() {
		self.navigationController?.navigationBar.setBackgroundImage(
				UIImage(), 
				for: .default
		)
		self.navigationController?.navigationBar.shadowImage = UIImage()
}
```

## Make transparent **`UINavigationBar`**

```swift
removeLineUnderNaviagtionBar()
self.navigationController?.navigationBar.isTranslucent = true
self.navigationController?.view.backgroundColor = .clear
```

## Add buttons in `UINavigationBar`

```swift
// in controller that in navigation stack
navigationItem.title = "Categories"
navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(donePressed(_:))
)
navigationItem.rightBarButtonItem?.tintColor = tintColor
navigationItem.rightBarButtonItem?.setTitleTextAttributes(
            [
                .font: UIFont.systemFont(ofSize: 18, weight: .thin)
            ],
            for: .normal
)
```

## Customize with `UIAppearance`

### iOS 5+

[https://developer.apple.com/documentation/uikit/uiappearance](https://developer.apple.com/documentation/uikit/uiappearance)

iOS applies appearance changes when a **view enters a window,** it doesn’t change the appearance of a **view that’s already in a window**. To change the appearance of a view that’s currently in a window, remove the view from the view hierarchy and then put it back.