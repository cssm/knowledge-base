# SwiftUI Data State

![](SwiftUI%20Data%20State/Untitled.png)

## Process Lifetime

### UI

```swift

@State // for some UI state that should not be rerendered

@Binding // to share an intance (not a copy) of @State or something else with another view

```

### Model

This one uses `ObservableObject` class

To publish part of this class mark needed properties with `@Published`

`ObservableObject` should be threaded as **facade** for data model

```swift
@ObservedObject // subscribing for changes in ObservableObject to update view automaticly and do not own this object

@StateObject // differ from @ObservableObject that its owns instance of observable object and ensures that object will be alive for whole view lifetime (a good candidate to use locally in views)

@EnvironmentObject // some global data that should exists in parents views and can be accessed anywhere 
```

## Extended Lifetime

⚠️ Do not use this to store comlicated data

```swift
@SceneStorage("key") // can only be accessed from view; managed by SwiftUI (good for saving selection of some element in UI)

@AppStorage("key") // can be accessed anywhere; managed by UserDefaults (good for saving user settings)
```

## Resources

[Data Essentials in SwiftUI - WWDC 2020 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2020/10040/)

[SwiftUI Data Flow](https://kean.blog/post/swiftui-data-flow#binding)

[Swift UI Property Wrappers](https://swiftuipropertywrappers.com)