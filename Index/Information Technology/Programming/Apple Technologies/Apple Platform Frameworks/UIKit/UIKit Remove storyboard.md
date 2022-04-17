# UIKit Remove storyboard

```swift
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {    
		window = UIWindow(frame: UIScreen.main.bounds)    
		let homeViewController = UIViewController()    
		homeViewController.view.backgroundColor = UIColor.red    
		window!.rootViewController = homeViewController    
		window!.makeKeyAndVisible()    
		return true
}
```