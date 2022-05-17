```swift
let tabBarController = UITabBarController()
let loginController = LoginViewController()
loginController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 0)
tabBarController.viewControllers = [loginController]
```