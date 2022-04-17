# Working With Files

[[Apple Working With Files]]

```swift
// read from file that is located in Bundle
func readFromFile(
  named fileName: String, 
  withExtension: String
) -> [String]? {
  guard 
	let fileURL = Bundle.main.url(
	 forResource: fileName, 
	 withExtension: withExtension
	),
    let string = try? String(contentsOf: fileURL, encoding: .utf8)
  else { return nil }
  return string.components(separatedBy: .newlines)
}
```