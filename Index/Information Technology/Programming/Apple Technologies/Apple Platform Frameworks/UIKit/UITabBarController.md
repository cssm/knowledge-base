- **Links**
	- [How To Customize Tab Bar Background and Appearance Old Way](https://direct.appcoda.com/ios-programming-how-to-customize-tab-bar-background-appearance/)

## Create & Configure
```swift
let tabBarController = UITabBarController()
let loginController = LoginViewController()
loginController.tabBarItem = UITabBarItem(
	tabBarSystemItem: UITabBarItem.SystemItem.favorites, 
	tag: 0
)
tabBarController.viewControllers = [loginController]
```

## Configure Appearance

```swift
// tab bar appearance
let tabBarAppearance = UITabBarAppearance()
tabBarAppearance.backgroundColor = .baseWhite100
tabBarAppearance.configureWithOpaqueBackground()

// tab bar item appearance
let tabItemAppereance = UITabBarItemAppearance()
tabItemAppereance.selected.iconColor = .baseBlueDark
tabItemAppereance.selected.titleTextAttributes = [
    .font: UIFont.caption1().withSize(13),
    .foregroundColor: UIColor.baseBlueDark
]
tabItemAppereance.normal.iconColor = .baseGray80
tabItemAppereance.normal.titleTextAttributes = [
    .font: UIFont.caption1().withSize(13),
    .foregroundColor: UIColor.baseGray80
]

// tab bar appearance is responsible for tab bar item's appearance
tabBarAppearance.stackedLayoutAppearance = tabItemAppereance
tabBarAppearance.inlineLayoutAppearance = tabItemAppereance
tabBarAppearance.compactInlineLayoutAppearance = tabItemAppereance

UITabBar.appearance().standardAppearance = tabBarAppearance
if #available(iOS 15, *) {
    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
}
```