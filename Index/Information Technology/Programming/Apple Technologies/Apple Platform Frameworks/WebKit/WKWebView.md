- **Links**
	- [Web Inspector on iOS devices and Simulators](https://bendodson.com/weblog/2022/04/13/web-inspector-on-ios-devices-simulators/)
- **Notes**
	- For some reason `WKWebView` can add random `_` to the end of query 
	- `WKNavigationDelegate`
		```swift
		public func webView(
			_ webView: WKWebView,
			decidePolicyFor navigationAction: WKNavigationAction,
			decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
		) {
		```