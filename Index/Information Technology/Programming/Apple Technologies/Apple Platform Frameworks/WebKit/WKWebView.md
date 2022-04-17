# WKWebView

For some reason `WKWebView` is adding random `_` to the end of query 

## WKNavigationDelegate

```swift
public func webView(
		_ webView: WKWebView,
		decidePolicyFor navigationAction: WKNavigationAction,
		decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
) {
```