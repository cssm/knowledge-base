# Date Formats

 - **Locale**
	- we can use `.autoupdatingCurrent` locale so system will decide which locale to use
- References
	- [Easy Skeezy Date Formatting for Swift and Objective-C](https://nsdateformatter.com/)

```swift
// parsing ISO 8601 date without time
let dateString = "2021-08-02"
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd"
formatter.locale = .autoupdatingCurrent
formatter.timeZone = .init(identifier: "GMT")
let date = formatter.date(from: dateString) // now this will be parsed correctly
```
```swift
// general usage
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .none
 
// US English Locale (en_US)
dateFormatter.locale = Locale(identifier: "en_US")
print(dateFormatter.string(from: Date())) // Jan 2, 2001
 
// French Locale (fr_FR)
dateFormatter.locale = Locale(identifier: "fr_FR")
print(dateFormatter.string(from: Date())) // 2 janv. 2001
```

```swift
// to create some custom style
dateForamtter.amSymbol = "am"
dateForamtter.pmSymbol = "pm"
dateForamtter.dateFormat = "MMMM d'th', yyyy - h:mm a"
```
