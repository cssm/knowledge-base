- **Notes**
	- a.k.a `SPM`
	- [Binary dependencies in SPM](Binary%20dependencies%20in%20SPM.md)
- **Links**
	- [apple/swift-package-manager: The Package Manager for the Swift Programming Language](https://github.com/apple/swift-package-manager)
	- [SwiftPackageIndex/PackageList: The master list of repositories for the Swift Package Index.](https://github.com/SwiftPackageIndex/PackageList)
	- [The Swift package manifest file - The.Swift.Dev.](https://theswiftdev.com/the-swift-package-manifest-file/)

## Package

Package - a description of group of targets and what products (libraries, executables) they form 

You can open package in Xcode from termianal by `open YourPackage/Package.swift` (This package shouldn't be opened in another `.xcproj`)

- Example
    
    ```swift
    import PackageDescription
     
    let package = Package(
        name: "Resources",
        platforms: [.iOS(.v11)],
        products: [
            .library(
                name: "Resources",
                targets: ["Resources"]),
        ],
        dependencies: [
    			// name should be a package name (not some custom stuff)
            .package(name: "R.swift.Library", url: "https://github.com/mac-cain13/R.swift.Library", .branch("master")),
            // local package
            .package(path: "../Core")
        ],
        targets: [
            // Это то из чего мы будем складывать наш продукт
            // Для таргета обязательно нужно создать папку 
          	// в Sources/имя_таргета для его работы
          	// либо если мы не хотим размещать его в Sources, можем указать "path:"
            .target(
                name: "Resources",
                dependencies: [
                    .product(name: "RswiftDynamic", package: "R.swift.Library")
                ],
                resources: [
                    // Все ресурсы которые мы хотим использовать нужно явно указать
                    // Путь к ним относительный от Sources/имя_пакета/то_что_мы_указали
                    // Если указываем папку, поиск идет рекурсивно
                    .process("Resources")
                ])
        ]
    )
    ```
    
- products
    
    `products` — Defines which executables and libraries defined in the project are visible to other packages.
    
    - .library(name:targets:)
    - .executable()
- dependencies (defines dependencies on other packages)
    
    ```swift
    // specify some speicific verison that should not change
    .package(url: "git@github.com:Example/Example.git", .exact("5.7.1"))
    
    // specify minimum verion (will automaticly update if something new is comming)
    .package(url: "git@github.com:teodorpatras/EasyTipView.git", from: "2.1.0")
    
    // version from specific branch
    .package(url: "git@github.com:maximkrouk/SweetUI.git", .branch("master"))
    
    // package with name added if it can't be resolved my SPM
    .package(name: "Facebook", url: "git@github.com:facebook/facebook-ios-sdk.git", from: "9.0.0")
    
    // speciy just major version
    .package(url: "https://github.com/ArtSabintsev/Siren.git", majorVersion: 5)
    ```
    
- targets
    - .target(name:dependencies)
        - some folder with files
        
        Target can depend on another target
        

## CLI

```swift
// Inicilize executable (if you want framework just drop --type attribute)
swift package init --type=executable

// Next command will download all dependencies and generate Xcode project
swift package generate-xcodeproj 

// Update package
swift package update

// Run tagret <TARGET_NAME>
swift run <TAGRET_NAME>

// Run all targets
swift run

// Build executeble without running
swift build

// Build executeble in release mode
swift build -c release 

// Run as release config (by default it's debug) 
swift run --configuration release

// Put package into editable mode by moving it into ./Dependencies folder
swift package edit <PACKAGE_NAME>
```

## Fixing Possible Problems

If repositry name ≠ package name we need to explicitly give name to dependencie

```swift
dependencies: [
	.package(
	  name: "Apollo",
    url: "https://github.com/apollographql/apollo-ios.git",
    from: "0.44.0"
  )
]
```

to remove a folder from Xcode sidebar (if this folder is in a package) - just add an ampty `Package.swift` file to it

## Resources

- [Apple Developer Documentation](https://developer.apple.com/documentation/swift_packages/organizing_your_code_with_local_packages)
- [How to Create a Swift Package From a C++ Library](https://betterprogramming.pub/how-to-create-a-swift-package-from-a-c-library-fb5cd606220f)

## Package

Package - a description of group of targets and what products (libraries, executables) they form 

You can open package in Xcode from termianal by `open YourPackage/Package.swift` (This package shouldn't be opened in another `.xcproj`)

- Example
    
    ```swift
    import PackageDescription
     
    let package = Package(
        name: "Resources",
        platforms: [.iOS(.v11)],
        products: [
            .library(
                name: "Resources",
                targets: ["Resources"]),
        ],
        dependencies: [
    			// name should be a package name (not some custom stuff)
            .package(name: "R.swift.Library", url: "https://github.com/mac-cain13/R.swift.Library", .branch("master")),
            // local package
            .package(path: "../Core")
        ],
        targets: [
            // Это то из чего мы будем складывать наш продукт
            // Для таргета обязательно нужно создать папку 
          	// в Sources/имя_таргета для его работы
          	// либо если мы не хотим размещать его в Sources, можем указать "path:"
            .target(
                name: "Resources",
                dependencies: [
                    .product(name: "RswiftDynamic", package: "R.swift.Library")
                ],
                resources: [
                    // Все ресурсы которые мы хотим использовать нужно явно указать
                    // Путь к ним относительный от Sources/имя_пакета/то_что_мы_указали
                    // Если указываем папку, поиск идет рекурсивно
                    .process("Resources")
                ])
        ]
    )
    ```
    
- products
    
    `products` — Defines which executables and libraries defined in the project are visible to other packages.
    
    - .library(name:targets:)
    - .executable()
- dependencies (defines dependencies on other packages)
    
    ```swift
    // specify some speicific verison that should not change
    .package(url: "git@github.com:Example/Example.git", .exact("5.7.1"))
    
    // specify minimum verion (will automaticly update if something new is comming)
    .package(url: "git@github.com:teodorpatras/EasyTipView.git", from: "2.1.0")
    
    // version from specific branch
    .package(url: "git@github.com:maximkrouk/SweetUI.git", .branch("master"))
    
    // package with name added if it can't be resolved my SPM
    .package(name: "Facebook", url: "git@github.com:facebook/facebook-ios-sdk.git", from: "9.0.0")
    
    // speciy just major version
    .package(url: "https://github.com/ArtSabintsev/Siren.git", majorVersion: 5)
    ```
    
- targets
    - .target(name:dependencies)
        - some folder with files
        
        Target can depend on another target
        