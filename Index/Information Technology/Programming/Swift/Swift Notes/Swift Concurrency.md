- **Notes**
	- [Swift AsyncSequence](Swift%20AsyncSequence.md)
	- Part of `Swift 5.5`
	- At current point `async/await` *fully* supports only `iOS 15+, macOS 12+` etc.
	- Works perfectly on `Linux`
	- `await` now can fully replace `completionHandler`
- **Links**
	- [AsyncCommunity/AsyncExtensions: AsyncExtensions aims to mimic Swift Combine operators for async sequences.](https://github.com/AsyncCommunity/AsyncExtensions)
	- [Подборка материалов по swift concurrency (async/await) | JonFir](https://jonfir.github.io/posts/async-await-materials/)
	- [Swift concurrency: Update a sample app - WWDC21 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2021/10194/)
	- [Concurrency - The Swift Programming Language (Swift 5.5)](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)
	- [Swift concurrency: Behind the scenes - WWDC21 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2021/10254/)
	- [Protect mutable state with Swift actors - WWDC21 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2021/10133/)
	- [Why is my @MainActor code running in the background](https://mobile.blog/2022/03/28/swift-why-is-my-mainactor-code-running-in-the-background/)

## Basics

```swift
// everything that marked with this attribute will run on main thread (but not always xD)
@MainActor 
func function() -> Bool { true }

let result = await function()

// every line of code of this class guranteed run on a main thread
@MainActor
class Kek {
	func kek() {
		print("kek")
	}
}
```

`Suspending` - function gives app thread on which it running to the system and ask system to schedule awaited work and schedule restore state of function. Now stystem free to run other functions on this thread. After work of suspended function finished system restores state of function and now function can continue to work. 

```swift
func asynco() async throws -> Bool { false } 

let closure: () async -> Void 

try await asynco()

await closure()
```

Calling `await` *may* suspend function 

## Manually manage suspending and continuation

![[Swift Concurrency/Untitled.png]]

![[Swift Concurrency/Untitled 1.png]]

warnings that we should be considered about

![[Swift Concurrency/Untitled 2.png]]

adopting `async` in delegates methods

## Structured Cuncurrency

`Task` - the way to add cuncurrency 

![[Swift Concurrency/Untitled 3.png]]

Which means that each `Task` will run cuncurrently

- if task throws - its canceled (but not immedatly), so we can explicilty check if task is canceled using `Task.isCanceled` (which will indicated if current scope task is canceled)
- tasks are **not** stopped imxmeadiatly after cancelation

Types of tasks:

- `async let` - creating `one` child task and **not suspending current thread**
    
    The child-task created to initialize the `async let` by default runs on the global concurrent, width-limited, executor that comes with the Swift Concurrency runtime.
    
    ![[Swift Concurrency/Untitled 4.png]]
    
    ![[Untitled_0.jpg]]
    
    - Parent task will wait until all child dask eather succeed and finished or canceled
    - If some of child tasks throws - other child task canceled
- Group task - will spawn a dynamic number of task in **PARALLEL**
    
    ![[Swift Concurrency/Untitled 5.png]]
    
    - `withTaskGroup(of: Type.self) { group in }`
    
    ![[Swift Concurrency/Untitled 6.png]]
    
    ⛔️
    
    ![[Swift Concurrency/Untitled 7.png]]
    
    ✅
    

## Unstructued Cuncurrency

- not bounded to scope
- need to be cancel manually

```swift
/// ... some not async code

// inherits priority and where to run from context of call
// e.g. if run from code that marked with @MainActor this work will have UI priority and will be run on main queue (added to the end of queue)

// default behaivour - runs immidiatly on the next available thread
async {
	let taskResult = await someTask()
}

/// ... some not async code
```

### Detached tasks

Do not inherits context priority (Do not run on main ) and do 

```swift
asyncDetached(priority: .background) {
	// do some word
}
```