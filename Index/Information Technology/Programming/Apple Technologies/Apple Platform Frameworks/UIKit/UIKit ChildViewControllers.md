- You need to add `childVC` root view to parent VC view hierarchy
```swift
let parent = UIViewController()
let child = UIViewController()
    
// First, add the view of the child to the view of the parent
parent.view.addSubview(child.view)
    
// Then, add the child to the parent
parent.addChild(child)
    
// Finally, notify the child that it was moved to a parent
child.didMove(toParent: parent)

//First and second steps can be swiched)
```

```swift
// First, notify the child that it’s about to be removed
child.willMove(toParent: nil)
    
// Then, remove the child from its parent
child.removeFromParent()
    
// Finally, remove the child’s view from the parent’s
child.view.removeFromSuperview()
```