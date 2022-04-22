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
![](Pasted%20image%2020211204173702.png)