- **Notes**
	- [Playground Shortcuts](Playground%20Shortcuts.md)
- **Links**
	- 
# Playgrounds

```swift
import PlaygroundSupport
```

## Stop execution

```swift
// stop the playground execution
PlaygroundPage.current.finishExecution()
```

## Working on async code in a playground

```swift
PlaygroundPage.current.needsIndefiniteExecution = true

DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    let greeting = "Hello after 3 seconds"
    print(greeting)
}

// finish execution
PlaygroundPage.current.finishExecution()
```

## Showing views

### SwiftUI

```swift
PlaygroundPage.current.setLiveView(SomeView())
```

### UIKit

```swift
PlaygroundPage.current.liveView = SomeViewController()
```

## Handling exceptions

By default playgrounds do not print description of error that happened. 

```swift
NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}
```

## Running tests

```swift
import Foundation
import XCTest

class PerformanceTests: XCTestCase {

    var getArray = {
        Array(repeatElement(0, count: 1000)) + Array(repeatElement(1, count: 1000))
    }

    func testFilter() {
        let array = getArray()
        measure {}
    }
    
}

PerformanceTests.defaultTestSuite.run()
```