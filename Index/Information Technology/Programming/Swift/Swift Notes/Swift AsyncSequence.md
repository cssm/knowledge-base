- Use `AsyncStream` when this stream produces some state but not for stateless stuff like delegate callbacks (for example XML parsing, when we saw the start of an element, we'd jump into a different method to interpret the rest of the sequence)
- [Meet AsyncSequence - WWDC21 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2021/10058)


```swift
for await id in ststicImageIDsURL.lines {
	let thumbnail = await fetchThumbnail(for: id)
	collage.add(thumbnail)
}
let result = await collage.draw()
```

Basicly starts some work as soon as some element of sequence is available, not vaiting for all items to be loaded