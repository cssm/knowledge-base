# UIKit Handling keyboard
- [Animate With The Keyboard In Swift](https://www.advancedswift.com/animate-with-ios-keyboard-swift/)

```swift
deinit {
  NotificationCenter.default.removeObserver(self)
}

init {
  subscripeToKeyboardEvents()
}

private func subscripeToKeyboardEvents() {
  NotificationCenter.default.addObserver(
  	self,
	selector: #selector(keyboardWillShow(_:)),
 	name: UIResponder.keyboardWillShowNotification,
	object: nil
  )
  NotificationCenter.default.addObserver(
	self,
	selector: #selector(keyboardWillHide(_:)),
	name: UIResponder.keyboardWillHideNotification,
	object: nil
  )
}

private func adjustInsetForKeyboardShow(_ show: Bool, notification: Notification) {
  guard let userInfo = notification.userInfo else { return }
  let keyboardFrame = (
  	userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
  ).cgRectValue
  if show {
	contentCenterConstraint.update(offset: -keyboardFrame.height/2)
  } else {
	contentCenterConstraint.update(offset: 0)
  }
}
    
@objc private func keyboardWillShow(_ notification: Notification) {
  adjustInsetForKeyboardShow(true, notification: notification)
}
    
@objc private func keyboardWillHide(_ notification: Notification) {
  adjustInsetForKeyboardShow(false, notification: notification)
}
```