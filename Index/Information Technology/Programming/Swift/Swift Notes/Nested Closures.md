# Nested [Swift Closures](Swift%20Closures.md)

```swift
class ViewControllerB: UIViewController {
    
    var workItem: DispatchWorkItem?
    
    override func viewDidLoad() {
        let view = self.view
	
        let workItem = DispatchWorkItem {  // this leaks because self is implicitly captured here
            UIView.animate(withDuration: 1.0) { [weak self] in
                view?.backgroundColor = .red
            }
        }
        self.workItem = workItem
    }
}

// to resolve it we can capture in self weakly (insed of implicit context capturing in example above) in parent closure
let workItem = DispatchWorkItem { [weak self] in
		UIView.animate(withDuration: 1.0) { 
				view?.backgroundColor = .red
		}
}

// or just capture only view so self is not captured 
override func viewDidLoad() {

        let view = self.view
        let workItem = DispatchWorkItem {
            UIView.animate(withDuration: 1.0) { // adding [weak self] here introduce retain cycle
                view.backgroundColor = .red
            }
        }
        self.workItem = workItem
    } 
```