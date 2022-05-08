- **Notes**
	- *Set timezone*
		- `Edit Scheme` → `Run (Debug)` → Add `environment variable` → Name it `TZ` → Any timezone name supported e.g. `UTC`, `PST`, `EST`, `America/Los_Angeles`
	- *Screenshot and Screen Recording*
		```swift
		xcrun simctl io booted screenshot <filename>.<file extension>

		xcrun simctl io booted recordVideo <filename>.<file extension>
		```
- **Links**
	-  [QMUI/LookinServer: Free macOS app for iOS view debugging.](https://github.com/QMUI/LookinServer)
	- [Sherlock - Give your iOS Simulator superpowers](https://sherlock.inspiredcode.io)
	- [Hot To Control iOS Simulators from CLI](https://medium.com/xcblog/simctl-control-ios-simulators-from-command-line-78b9006a20dc)
	- [Better Simulator Recording App](https://github.com/twostraws/ControlRoom)