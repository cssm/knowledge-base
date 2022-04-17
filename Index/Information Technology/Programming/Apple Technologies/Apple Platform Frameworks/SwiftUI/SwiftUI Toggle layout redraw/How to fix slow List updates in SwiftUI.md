Code below is working very slow:
```swift
struct ContentView: View {
    @State var items = Array(1...600)

    var body: some View {
        VStack {
            Button("Shuffle") {
                self.items.shuffle()
            }

            List(items, id: \.self) {
                Text("Item \($0)")
            }
        }
    }
}
```

But we have a pretty easy fix, just add `UUID`:
```swift
List(items, id: \.self) {
    Text("Item \($0)")
}
.id(UUID())
```

This works because we generate a new list every time shuffle button pressed (because of different UUID’s) so SwiftUI doesn’t compare all elements to animate changes in list.

we lose list update animation.