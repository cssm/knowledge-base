# SwiftUI Elements positioning

If your layout has one dominant view that **defines the size of the layout**, use the `overlay(_:alignment:)` or `background(_:alignment:)` view modifier on that view.

```swift
// ✅
struct ContentView: View {
  var body: some View {
    Color.yellow
      .frame(width: 200, height: 200)
      .overlay(Text("Five Stars"), alignment: .leading)
  }
}

// 🛑
struct ContentView: View {
  var body: some View {
    Color.yellow
      .frame(width: 200, height: 200)
      .overlay(
        HStack {
          Text("Five Stars")
          Spacer()
        }
      )
  }
}
```

when we set maxWidth to `.infinity` we say to SwiftUI to use as much width as available 

```swift
// instead of this
struct ContentView: View {
  var body: some View {
    HStack {
      Text("Five Stars")
      Spacer()
    }
  }
}

// we can use this
struct ContentView: View {
  var body: some View {
    Text("Five Stars")
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}
```