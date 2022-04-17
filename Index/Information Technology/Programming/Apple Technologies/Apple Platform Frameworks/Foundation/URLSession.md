# URLSession

we can user `URLSessionDelegate` to handle redirects on some `URLSession` task

## Basics

`waitsForConnectivity = true` - if connection will lost request will resented after connection will established once again

```swift
// Task creation
let task = URLSession.shared.dataTask(with: url) { data, response, error in
		print("DONE")
		DispatchQueue.main.async { [weak self] in
				self?.label.text = "ok"
		}
}

task.resume() // start task executing
```

```swift
// Error handling
if let response = response as? HTTPURLRespons {
		switch response.statusCode {
		case 200..<300:
				break
		default:
				print(response.statusCode)
		}
}
```

## URLSessionDelegate

```swift
public func urlSession(
		_ session: URLSession,
		task: URLSessionTask,
		willPerformHTTPRedirection response: HTTPURLResponse,
		newRequest request: URLRequest,
		completionHandler: @escaping (URLRequest?) -> Void
) {}
```