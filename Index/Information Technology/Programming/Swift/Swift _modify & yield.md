- **Notes**
	- For more info  read [code optimizations note](Swfit%20Code%20Optimizations.md#Lifehacks)
		```swift
		private extension CopyOnWrite {
		  final class Ref<T> {
			var value: T
			init(_ value: T) { self.value = value }
		  }
		}

		struct CopyOnWrite<T> {
		  private var ref: Ref<T>

		  init(val: T) { ref = .init(val) }

		  var value: T {
			get { ref.value }
			set {
			  guard isKnownUniquelyReferenced(&ref) else {
				ref = .init(newValue)
				return print("new alloc")
			  }
			  print("reuse")
			  ref.value = newValue
			}
		  }
		}

		final class A {
		  private var _lol = [Int: CopyOnWrite<Int>]()
		  init(value: Int) {
			_lol[1] = .init(val: value)
		  }
		  subscript(index: Int) -> CopyOnWrite<Int> {
			get { _lol[index]! }
			_modify { yield &_lol[index]! }
		  }
		  subscript(index: String) -> CopyOnWrite<Int> {
			get { _lol[1]! }
			set { _lol[1] = newValue }
		  }
		}

		let a = A(value: 14)

		// with _modify
		a[1].value += 1 // reuse

		// with get set
		a["lol"].value += 1 // new alloc
		```