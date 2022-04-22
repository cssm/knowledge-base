- *[Open Source](../../../../Open%20Source.md)*
	- [OpenCombine/OpenCombine: Open source implementation of Apple's Combine framework for processing values over time.](https://github.com/OpenCombine/OpenCombine)
- **Links**
	- [Book about Combine](https://heckj.github.io/swiftui-notes/)
	- [pointfreeco/combine-schedulers: A few schedulers that make working with Combine more testable and more versatile.](https://github.com/pointfreeco/combine-schedulers)
- [RunLoop](../../RunLoop.md)
	- [RunLoop.main vs DispatchQueue.main: The differences explained](https://www.avanderlee.com/combine/runloop-main-vs-dispatchqueue-main/)
		- If using `RunLoop.main` as scheduler Default RunLoop mode is used  -> Complition will not complete until RunLoop changes from UIHandling mode back to Default Mode
- **Notes**
	- `Publisher` - object that emits values
		- `Just` - emits event ones and finishes
		- `Future` - allows to wrap [Swift Closures](../../Swift/Swift%20Notes/Swift%20Closures.md)  into publishers
			- emits value only ones
			- stores the result of body in publisher and emits `promise(Result)` only on subscribe
			- subscribing to the same `Future` multiple times will yield in the same result
			- by default executes it's body imminently, to execute body only on subscription - **wrap it in `Deffered`**
			```swift
			func createRegularFuture() -> Future<Int, Never> {
			  return Future { promise in
				print("Closure executed")
				promise(.success(42))
			  }
			}

			func createDeferredFuture() -> AnyPublisher<Int, Never> {
			  return Deferred {
				Future { promise in
				  print("Closure executed")
				  promise(.success(42))
				}
			  }.eraseToAnyPublisher()
			}

			let regular = createRegularFuture() // "Closure executed"
			let sub1 = regular.sink(receiveValue: { value in 
			  print("\(value)") // 42
			}) 
			let sub2 = regular.sink(receiveValue: { value in 
			  print("\(value)") // 42
			}) 

			let deferred = createDeferredFuture() 
			// "Closure executed"
			let sub3 = deferred.sink(receiveValue: { value in 
			  print("\(value)") // 42
			}) 
			// "Closure executed"
			let sub4 = deferred.sink(receiveValue: { value in 
			  print("\(value)") // 42
			}) 
			```
	- `Subscriber` - object that receives values
	- `sink` returns token of subscription. We can call `cancel()` on it to unsubscribe or this will happen when object destroyed 
	- We need to handle `receiveCompletion` only if over publisher can fail (i.e `Failure` is not `Never`)
	- *How to fix compiler errors?*
		- Just write return type explicitly in all closures
	- *Subjects*
		- `Subject` act both as a `Subcriber` and a `Publisher`.
		- *PassthroughSubject* - drops values if no subscribers
	- *Operators*
		- `catch` - replace error with another publisher
		- `makeConnectable()` - too not start sending values after first subscriber attached only $n$ call of `connect()`
	- *`TopLevelEndocer` & `TopLevelDecoder`*
		- Protocols that introduce generic way to decode/encode something and not be tied to `Data` only. 
		- `JSONEncoder` and `JSONDecoder` not conforms to any protocols and API of `decode` and `encode` methods not required. That bad!
	- *Code Snippets*
	```swift
	let url = URL(string: "https://api.github.com/repos/johnsundell/publish")!
	let publisher = URLSession.shared.dataTaskPublisher(for: url)

	let cancellable = publisher
	  .receive(on: DispatchQueue.main) // DispatchQueue.main.async {}
	  .sink(
		receiveCompletion: { completion in
		// Called once, when the publisher was completed.
			print(completion)
		},
		receiveValue: { value in
		  // Can be called multiple times, each time that a
		  // new value was emitted by the publisher.
		  print(value)
		}
	  )
	```
	```swift
	// Decoding data
	let url = URL(string: "https://api.github.com/repos/johnsundell/publish")!
	let publisher = URLSession.shared.dataTaskPublisher(for: url)

	let p = publisher
		.map(\.data)
		.decode(type: String.self, decoder: JSONDecoder())

	let cancellables = p.sink(
		receiveCompletion: { print($0) },
		receiveValue: { print($0) }
	)
	```
	```swift
	// PassthroughSubject
	var publisher: AnyPublisher<Int, Never> {
	  subject.eraseToAnyPublisher()
	}

	private let subject = PassthroughSubject<Int, Never>() 

	private var cancellables = Set<AnyCancellable>()

	subject.sink {
	  print($0) // 1 2
	}
	.store(in: &cancellables)

	subject.send(1)
	subject.send(2)
	```
	```swift
	//  TopLevelEndocer & TopLevelDecoder
	protocol TopLevelEncoder {
	  associatedtype Output
	  func encode<T: Encodable>(_ value: T) throws -> Output
	}

	protocol TopLevelDecoder {
	  associatedtype Input
	  func decode<T: Decodable>(_ type: T.Type, from: Input) throws -> T
	}

	extension JSONEncoder: TopLevelEncoder {}
	extension JSONDecoder: TopLevelDecoder {}
	extension PropertyListEncoder: TopLevelEncoder {}
	extension PropertyListDecoder: TopLevelDecoder {}
	```
	```swift
	// Custom Publishers
	extension Publishers {
		final class CustomPublisher: Publisher {}
	}
	```