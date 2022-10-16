```swift
let vc = UIViewController()

switch vc {
case is UITableViewController:
	break
case is UICollectionViewController
	break
default:
	break
}
```

```swift
let i = 2

switch i {
case _ where i.isMultiple(of: 2):
	break
default:
	break
}
```