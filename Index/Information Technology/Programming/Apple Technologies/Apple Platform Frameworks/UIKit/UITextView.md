- [https://stackoverflow.com/questions/746670/how-to-lose-margin-padding-in-uitextview](https://stackoverflow.com/questions/746670/how-to-lose-margin-padding-in-uitextview)
```swift
final class CustomTextView: UITextView, UITextViewDelegate {
	// This hack allows us to disable selection of text but handle urls
	// `isSelectable` should be set to `true`
	public override var canBecomeFirstResponder: Bool { false }
}
```