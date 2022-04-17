# URLComponents

```swift
enum Sorting: String {
	case numberOfStars = “stars”
	case numberOfForks = “forks”
	case recency = “updated”
}
```

```swift
func findRepositories(matching query: String, sortedBy sorting: Sorting) {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.github.com"
    components.path = "/search/repositories"
    components.queryItems = [
        URLQueryItem(name: "q", value: query),
        URLQueryItem(name: "sort", value: sorting.rawValue)
    ]

    // Getting a URL from our components is as simple as
    // accessing the 'url' property.
    let url = components.url
    ...
}
```