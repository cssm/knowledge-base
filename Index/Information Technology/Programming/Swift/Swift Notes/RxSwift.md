# RxSwift

Everything is **observable sequence**

```swift
let helloSequence = Observable.just("Hello Rx")
let fibonacciSequence = Observable.from([0, 1, 1, 2, 3, 5, 8])
let dictSequence = Observable.from([1: "Hello", 2: "World"])
```

Subscribing on sequence

```swift
let helloSequence = Observable.of("Hello Rx")

let subscription = helloSequence.subscribe { event in**
		print(event)
}

// OUTPUT
// next("Hello Rx")
// completed
```

Observable sequences can emit **zero** **or more events** over their lifetimes.

In **RxSwift** an Event is just an **Enumeration Type** with 3 possible states:

- `.next(value: T)` — When a value or collection of values is added to an observable sequence it will send the **next event** to its subscribers as seen above. The associated value will contain the actual value from the sequence.
- `.error(error: Error)` — If an Error is encountered, a sequence will emit an **error event**. This will also terminate the sequence.
- `.completed`— If a sequence ends normally it sends a **completed event** to its subscribers

```swift
let helloSequence = Observable.from(["H", "e", "l", "l", "o"])
let subscription = helloSequence.subscribe { event in
		switch event {
		case .next(let value):
				print(value)
		case .error(let error):
				print(error)
		case .completed:
				print("completed")
		}
}

// OUTPUT:
// H e l l o
// completed
```

## Cancel subscription

- call `dispose()`
- Add the subscription to a **Disposebag** which will cancel the subscription for you automatically on **deinit** of the DisposeBag Instance

```swift
// Creating a DisposeBag so subscribtion will be cancelled correctly
let bag = DisposeBag()

// Creating an Observable Sequence that emits a String value
let observable = Observable.just("Hello Rx!")

// Creating a subscription just for next events
let subscription = observable.subscribe(onNext: {
		print($0)
})

// Adding the Subscription to a Dispose Bag
subscription.addDisposableTo(bag)
```

A Subject is a special form of an Observable Sequence, you can subscribe and dynamically add elements to it. There are currently 4 different kinds of `Subjects` ****in **RxSwift**

- `PublishSubject`**:** If you subscribe to it you will get all the events that will happen after you subscribed.
- `BehaviourSubject`**:** A behavior subject will give any subscriber the most recent element and everything that is emitted by that sequence after the subscription happened.
- `ReplaySubject`**:** If ****you want to replay more than the most recent element to new subscribers on the initial subscription you need to use a . With a , you can define how many recent items you want to emit to new subscribers.
- `Variable`**:** A Variable is just a  wrapper that feels more natural to a none reactive programmers. It can be used like a normal Variable.

You can add new Values to that sequence by using the `onNext()` function

Operators will work on the same thread as where the subscription is created. In RxSwift you use schedulers to force operators do their work on a specific queue. You can also force that the subscription should happen on a specific Queue. You use `subscribeOn` and `observeOn` for those tasks. If you are familiar with the concept of operation-queues or dispatch-queues this should be nothing special for you. A scheduler can be serial or concurrent similar to GCD or OperationQueue. There are 5 Types of Schedulers in RxSwift:

- **`MainScheduler`** — “Abstracts work that needs to be performed on MainThread. In case schedule methods are called from the main thread, it will perform the action immediately without scheduling.This scheduler is usually used to perform UI work.”
- **`CurrentThreadScheduler`** — “Schedules units of work on the current thread. This is the default scheduler for operators that generate elements.”
- **`SerialDispatchQueueScheduler`** — “Abstracts the work that needs to be performed on a specific dispatch_queue_t. It will make sure that even if a concurrent dispatch queue is passed, it's transformed into a serial one.Serial schedulers enable certain optimizations for observeOn.The main scheduler is an instance of SerialDispatchQueueScheduler"
- **`ConcurrentDispatchQueueScheduler`** — “Abstracts the work that needs to be performed on a specific dispatch_queue_t. You can also pass a serial dispatch queue, it shouldn't cause any problems. This scheduler is suitable when some work needs to be performed in the background.”
- **`OperationQueueScheduler`** — “Abstracts the work that needs to be performed on a specific NSOperationQueue. This scheduler is suitable for cases when there is some bigger chunk of work that needs to be performed in the background and you want to fine tune concurrent processing using maxConcurrentOperationCount.”

```swift
let publish1 = PublishSubject<Int>()
let publish2 = PublishSubject<Int>()
let concurrentScheduler = ConcurrentDispatchQueueScheduler(qos: .background)

Observable
	.of(publish1,publish2)
	.observeOn(concurrentScheduler)
	.merge()
	.subscribeOn(MainScheduler())
	.subscribe(onNext:{**
			print($0)
	})

publish1.onNext(20)
publish1.onNext(40)
// OUTPUT: 20 40
```