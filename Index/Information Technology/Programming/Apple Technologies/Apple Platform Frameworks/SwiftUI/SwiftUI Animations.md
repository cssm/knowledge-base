 - **Links**
	 - [Why Conditional View Modifiers are a Bad Idea](https://www.objc.io/blog/2021/08/24/conditional-view-modifiers/)
		 - because it's breaks animations 
 - `withAnimation`
	- Will add view to view hierarchy with default [SwiftUI](../SwiftUI.md)  animation
	```swift
	@Binding internal var isInFocus: Bool

	var body: some View {
		if fileURL != nil {
			TabView(fileURL: $fileURL)
			.opacity(isInFocus ? 0.3 : 1.0)
				.onTapGesture {
			  withAnimation { isInFocus = false }
		  }
		}
	}
	```
- Transitions
	- Add element with transition
	```swift
	@Binding internal var isInFocus: Bool

	var body: some View {
		if fileURL != nil {
			TabView(fileURL: $fileURL)
				.transition(.move(edge: .top))
			.opacity(isInFocus ? 0.3 : 1.0)
				.onTapGesture {
			  withAnimation { isInFocus = false }
		  }
		}
	}
	```