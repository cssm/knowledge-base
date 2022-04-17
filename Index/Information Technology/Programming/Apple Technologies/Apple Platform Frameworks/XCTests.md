# XCTests

> Writing unit-tests on Apple's platforms
> 

## Test Cases

```swift
final class KekTests: XCTestCase {
	// function need to have prefix `test`
	func testSomeKek() {
	
	}
}
```

## Test Network Calls

```swift
// content of some test function in KekTests
let expectation = XCTestExpectation()
var result = ""
networkClient.call { result in
	switch result {
	case .success:
		result = "Success"
	case .failure:
		result = "Error"
	}
	expectation.fullfill() // end test waiting
}
XCTWaiter().wait(for: [expectation], timeout: 1.5)
XCTAssertEqual(result, "Success")
```

```swift
// content of some test function in KekTests 
let expectation = self.expectation(description: #function)
var result = ""
networkClient.call { result in
	switch result {
	case .success:
		result = "Success"
	case .failure:
		result = "Error"
	}
	expectation.fullfill() // end test waiting
}
waitForExpectations(timeout: 10)
XCTAssertEqual(result, "Success")
```