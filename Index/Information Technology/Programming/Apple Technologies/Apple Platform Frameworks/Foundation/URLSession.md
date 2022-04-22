- **Links**
	- [Technical Q&A QA1941: Handling “The network connection was lost” Errors](https://developer.apple.com/library/archive/qa/qa1941/_index.html#//apple_ref/doc/uid/DTS40017602)
	- [URLSession Tutorial: Getting Started | raywenderlich.com](https://www.raywenderlich.com/3244963-urlsession-tutorial-getting-started#toc-anchor-009)
	- [Resumable Downloads | kean.blog](https://kean.blog/post/resumable-downloads)
- **Notes**
	- `waitsForConnectivity = true` - if connection will lost request will resented after connection will established once again
	- we can user `URLSessionDelegate` to handle redirects on some `URLSession` task
		```swift
		public func urlSession(
				_ session: URLSession,
				task: URLSessionTask,
				willPerformHTTPRedirection response: HTTPURLResponse,
				newRequest request: URLRequest,
				completionHandler: @escaping (URLRequest?) -> Void
		) {}
		```