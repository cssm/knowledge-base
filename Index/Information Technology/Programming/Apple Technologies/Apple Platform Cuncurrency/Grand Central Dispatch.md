- **Notes**
	- *GCD (Grand Central Dispatch)*
	- There’re some optimisations in GCD that guarantee that when we run **sync** task on some queue this task **will executed on caller thread** not the queue. There’re only exception for **main queue - sync task will always executed on the main thread, not the caller**.
	- `DispatchQueue.concurrentPeform(iterations: Int) {}`  - allows to cuncurrently iterate (very effective with good amount of `iterations`
	- `DispatchIO` - allows to work with files using dispatch groups
	- `DispatchWorkItem` - allows to cancel task (only if it already not excuting)
	- [DispatchSource](DispatchSource.md)
	- [Modernizing use of GCD](Modernizing%20use%20of%20GCD.md)
	- [GCD Efficiency Tips](GCD%20Efficiency%20Tips.md)

## Performance

- Always reduce amount of context switches (they’re more expensive than computing something heavy)**
- For example [Nuke]([https://github.com/kean/Nuke](https://github.com/kean/Nuke)) uses `OperationQueue` with target queue set to shared app’s internal queue.
- A dispatch queue inherits the minimum quality-of-service level from its target queue
- Changing `QoS` on queue basically do nothing because every queue has a target queue

## Overcommiting Queue's

- *Overcommit concurrent queue* - creates a new thread on every running task if needed
- *Non-Overcommit concurrent queue* - limits number of threads that can be created
- [Default target queue for every serial queue created is OVERCOMMIT]([https://forums.swift.org/t/what-is-the-default-target-queue-for-a-serial-queue/18094/5](https://forums.swift.org/t/what-is-the-default-target-queue-for-a-serial-queue/18094/5))
- Default target queue
	- For concurrent queue - global NON-OVERCOMMIT concurrent queue
		- `DispatchQueue.gloabal(qos: .default))`
	- For serial queue - is global OVERCOMMIT concurrent queue 
		- `__dispatch_get_global_queue(Int(QOS_CLASS_DEFAULT.rawValue), 2)`

```swift
let serial = DispatchQueue(label: "serial")
let concurrent = DispatchQueue(label: "concurrent", attributes: .concurrent)

let DISPATCH_QUEUE_OVERCOMMIT = 2
let defaultOvercommit = __dispatch_get_global_queue(Int(QOS_CLASS_DEFAULT.rawValue), 2)

let serial_1 = DispatchQueue(label: "serial_1", target: serial)
let serial_2 = DispatchQueue(label: "serial_1", target: concurrent)

let group = DispatchGroup()

group.enter()
serial.async {
  dispatchPrecondition(condition: .onQueue(serial))
  dispatchPrecondition(condition: .onQueue(defaultOvercommit))
  print("on serial")
  group.leave()
}

group.enter()
concurrent.async {
  // Both preconditions are met
  dispatchPrecondition(condition: .onQueue(concurrent))
  dispatchPrecondition(condition: .onQueue(DispatchQueue.global(qos: .default)))
  print("on concurrent")
  group.leave()
}

group.enter()
serial_1.async {
  dispatchPrecondition(condition: .onQueue(serial))
  dispatchPrecondition(condition: .onQueue(defaultOvercommit))
  print("again on serial")
  group.leave()
}

group.enter()
serial_2.async {
  // Both preconditions are met
  dispatchPrecondition(condition: .onQueue(concurrent))
  dispatchPrecondition(condition: .onQueue(DispatchQueue.global(qos: .default)))
  print("again on concurrent")
  group.leave()
}

group.wait()
```

## Target Queue

- *Target queue* - where execution happens when block that was added to queue is ready to be executed i.e. will be enqueued next
- Only the global concurrent queues and the main queue get to execute blocks. All other queues must (eventually) target one of these special queues.**
- Concurrent queue’s process items in FIFO order but DO NOT WAIT UNTIL closure will finish it execution. So if concurrent queue has as target queue a serial queue than they will be executed as on serial queue

## Preconditions

```swift
dispatchPrecondition(condition: .onQueue(serial)) // precondition check
```

## Sync on main thread

```swift
// ❌❌❌
// on main queue

DispatchQueue.main.sync {} // deadlock

DispatchQueue.global().sync {} // blocking waiting
```

```swift
// ✅✅✅
func syncOnMainThread<T>(execute block: () throws -> T) rethrows -> T {
		if Thread.isMainThread {
				return try block()
		}
		return try DispatchQueue.main.sync(execute: block)
}
```

## Synchronize execution of threads

### **DispatchSemaphore**

```swift
let sem = DispatchSemaphore(value: 2)
for _ in 0 ..< 4 {
		DispatchQueue.global().async {
				sem.wait()
				sleep(1)
				sem.signal()
		}
}
```

![](GCD%20(Grand%20Central%20Dispatch)/Thread_1.png)

![](GCD%20(Grand%20Central%20Dispatch)/Thread_2.png)

`wait()` - if the value is not 0, decrement it, otherwise block until something signals the semaphore

`signal()` - if there are threads waiting, unblock one of them, otherwise increment the value.

### **DispatchGroup**

`DispatchGroup.wait(timeout:)` vs `.wait(wallTimeout:)` 
	- First one is [Monotonic Time](Monotonic%20Time.md) and second one is not

![](GCD%20(Grand%20Central%20Dispatch)/DispatchGroup.png)

![](GCD%20(Grand%20Central%20Dispatch)/DispatchGroup%201.png)

![](GCD%20(Grand%20Central%20Dispatch)/Thread_1%201.png)

![](GCD%20(Grand%20Central%20Dispatch)/Thread_2%201.png)

![](GCD%20(Grand%20Central%20Dispatch)/Thread_2%202.png)

`enter()` - increments

`leave()` - decrements

`wait()` - blocks calling thread until last `leave()` call

## Notify when all done

```swift
let group = DispatchGroup()
group.enter()
DispatchQueue.global().async {
		print("Hello")
		group.leave()
}

group.notify(queue: .main) {
		print("All tasks are done")
}
```

```swift
// Barrier blocks resource on write

let q = DispatchQueue.global(qos: .utility)
q.async { // some code }
q.async { // some code }
q.async(flags: .barrier) {
		print("All tasks are done")
}
```

## Execute after some time

```swift
DisptachQueue.main.asyncAfter(deadline: .now() + 5.5) {
    print("Hello world")
}
```