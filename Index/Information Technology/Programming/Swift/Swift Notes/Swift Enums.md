- Conforming to protocol
```swift
protocol EnumProtocol {
  static func test(_ lol: Int) -> Self
}

// ✅ 
enum A: EnumProtocol {
  case test(_ kek: Int)
}
```

```swift
typealias Version = String
enum OperationSystem {
  case macOS(Version)
  case iOS(Version)
  case watchOS(Version)
  case tvOS(Version)
}

let os: OperationSystem = .macOS("11.0")

guard case let .macOS(version) = os else { return }
print(version) // 11.0

guard case .macOS(let version) = os else { return }
print(version) // 11.0

if case let .macOS(version) = os {}

let oses: [OperationSystem] = [.iOS("9.0"), .macOS("11.0")]
    
for case .macOS(let version) in oses {
		print(version) // 11.0
}
```