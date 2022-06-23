- Transform publisher into another publisher
```swift
[1, 2, 3].publisher
    .flatMap { int in (0...int).publisher }
    .sink { value in
        print(value, terminator: " ") // 0 1 0 1 2 0 1 2 3
    }

// use maxPublishers to restrict number of active publishers
// useful when we have a publisher with non constant time delta between events
// for example dataTaskPublisher making a network call so it can be pretty slow
// and we should not create new publishers until last publiser completes
aPublisherThatEmitsURLs.flatMap(maxPublishers: .max(1)) { url in
    URLSession.shared.dataTaskPublisher(for: url)
}

// same effetc as above but make latest publisher active and drop previous
aPublisherThatEmitsURLs
  .map { url in URLSession.shared.dataTaskPublisher(for: url) }
  .switchToLatest()
```