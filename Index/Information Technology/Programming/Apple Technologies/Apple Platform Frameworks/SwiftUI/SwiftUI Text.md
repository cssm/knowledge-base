- `Font`
```swift
struct ContentView: View {
  var body: some View {
    VStack {
      Text("Hello, World!")
        .font(.system(.largeTitle, design: .default).bold())
      Text("Hello, World!")
        .font(.system(.largeTitle, design: .serif).bold())
      Text("Hello, World!")
        .font(.system(.largeTitle, design: .rounded).bold()) // SF Pro Rounded
      Text("Hello, World!")
        .font(.system(.largeTitle, design: .monospaced).bold())
    }
  }
}
```
![[Pasted image 20211204173702.png]]