# os_log

## General

Available from `iOS 10`

We **can't** use string interpolation

We can collect logs from `Console.app`

## Log levels

- **noice (default)**
- **info**
- **debug**
- **error**
- **fault**

## Example

```swift
import os

extension OSLog {
	private static var subsystem = Bundle.main.bundleIdentifier!

	/// Logs the view cycles like viewDidLoad.
	static let viewCycle = OSLog(subsystem: subsystem, category: "viewcycle")
}

// simple message
os_log("View did load!", log: OSLog.viewCycle, type: .info)

// with connected debugger output is the same. but if some hacker tried to connect phone a view logs, hi only sees <private> insead of username
os_log(
	"User %{public}@ logged in", log: OSLog.userFlow, type: .info, username
)
os_log(
	"User %{private}@ logged in", log: OSLog.userFlow, type: .info, username
)
```