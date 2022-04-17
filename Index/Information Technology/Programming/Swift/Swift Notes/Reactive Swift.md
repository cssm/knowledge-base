# Reactive Swift

[ReactiveCocoa/ReactiveSwift](https://github.com/ReactiveCocoa/ReactiveSwift)

[Reactive Programming: Introduction to ReactiveSwift](https://medium.com/fueled-engineering/reactive-programming-introduction-to-reactiveswift-c3fcef5e896)

## Summary

```swift
//Defining consumer
let observer = Signal<Bool, NoError>.Observer(value: { value in
    button.isEnabled = value
})

//Defining produce
let signal = textField.reactive.continuousTextValues
let transformedSignal = signal
		.map { text in text ?? "" }
		.map { text in text.characters.count > 10 }

//Consuming signal
let disposable = transformedSignal.observe(observer)

//Limit Scope
disposable?.dispose()
```

```swift
//Create an observer
let signalObserver = Signal<Int, NoError>.Observer(
		value: { value in
		    print("Time elapsed = \(value)")
		}, completed: { 
		    print("completed") 
		}, interrupted: { 
		    print("interrupted") 
		}
)

//Create an a signal
let (output, input) = Signal<Int, NoError>.pipe()

//Send value to signal
for i in 0 ..< 10 {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0 *  Double(i)) {
			  input.send(value: i)
		 }
}

//Observe the signal
let _ = output.observe(signalObserver)
```

Therefore, `Signals` are generally used to represent event streams that are already “in progress,” such as notifications, user input, etc. `SignalProducers`, on the other hand, are used to represent operations or tasks which need to be started. For example, like network requests, where each invocation of start will create a new underlying operation. In the case of a `Signal`, the results might be sent before any observers are attached. In the case of a `SignalProducer`, the results are not sent unless it is started.

```swift
let signalProducer: SignalProducer<Int, NoError> = SignalProducer { observer, lifetime in
    for i in 0..<10 {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0 *  Double(i)) { 
						guard !lifetime.hasEnded else {
               observer.sendInterrupted()
               return
						}         
			      observer.send(value: i)
			      if i == 9 {
				        observer.sendCompleted()
			      }
		    }
	  }
}
```

```swift
// This is quite useful when we just have to deal with values, not errors.
let property = Property(initial: 0, then: signalProducer)

property.producer.startWithValues { value in
		print("[Observing SignalProducer] Time elapsed = \(value)")
}

let mutableProperty = MutableProperty(1)
mutableProperty.value = 3
mutableProperty <~ signalProducer
```

```swift
// Actions
// An action is defined as a unit of repeatable work which gets executed with a varying input.

let action = Action<(Int), Int, NoError>(execute: { timeInterval in
		return SignalProducer { input, lifetime in } 
})

//1. Observe values received
action.values.observeValues { value in
		print("Time elapsed = \(value)")
}

//2. Observe when action completes
action.values.observeCompleted {
		print("Action completed")
}

//1. Apply the action with inputs and start it
action.apply(1).start()

//2. Ignored as action was busy executing
action.apply(2).start()

//3. Will be executed as it is started after `action.apply(1)` completed
DispatchQueue.main.asyncAfter(deadline: .now() + 12.0) {
    action.apply(3).start()
}
```

## Disposables

`SerialDisposable` disposes of its wrapped disposable and allows it to be replaced. This is useful in scenarios where you want the previous observation to end when the new observation starts.`SerialDisposable` has a property called `inner` of type `Disposable`. When we assign disposables of any observation to this inner property, it will dispose of the old inner disposable.

`ScopedDisposable` disposes of its wrapped disposable when it deinitializes.

```swift
let serialDisposable = SerialDisposable()
let scopedDisposable: ScopedDisposable<AnyDisposable>
    
init() {
		self.scopedDisposable = ScopedDisposable(serialDisposable)
}
```

`CompositeDisposable` maintains a collection of other disposables. When its dispose method is called, all the collection of disposables are disposed of. This disposable is useful when you want to stop listening to all the signals and `signalProducers` .