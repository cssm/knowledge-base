# Concurrency by Tutorial

**Note**: It’s important to keep in mind that, while the queues are FIFO based, that does not ensure that tasks will finish in the order you submit them. The FIFO procedure applies to when the task starts, not when it finishes.

## **Serial and concurrent queues**

Serial queues only have a single thread associated with them and thus only allow a single task to be executed at any given time. A concurrent queue, on the other hand, is able to utilize as many threads as the system has resources for. Threads will be created and released as necessary on a concurrent queue.

**Note**: While you can tell iOS that you'd like to use a concurrent queue, remember that there is no guarantee that more than one task will run at a time. If your iOS device is completely bogged down and your app is competing for resources, it may only be capable of running a single task.

## **Operation subclassing**

Unlike GCD, an operation is run synchronously by default, and getting it to run asynchronously requires more work. While you can directly execute an operation yourself, that’s almost never going to be a good idea due to its **synchronous nature**.

## **BlockOperation**

If you don’t want to also create a DispatchQueue, then you can instead utilize the BlockOperation class. BlockOperation subclasses Operation for you and manages the concurrent execution of one or more closures on the default global queue.

**Note**: Block operations run concurrently. If you need them to run serially, you'll need to setup a dispatch queue instead.

**Note**: Global queues are always concurrent and first-in, first-out.

If you submit a task with a higher quality of service than the queue has, the queue’s level will increase. Not only that, but all the operations enqueued will also have their priority raised as well.

## **DispatchGroup**

```swift
let group = DispatchGroup()
someQueue.async(group: group) { ... your work ... } 
someQueue.async(group: group) { ... more work .... } 
someOtherQueue.async(group: group) { ... other work ... } 
group.notify(queue: DispatchQueue.main) { [weak self] in 
    self?.textLabel.text = "All jobs have completed" 
}
```

## **Synchronous waiting**

```swift
let group = DispatchGroup()
someQueue.async(group: group) { ... }
someQueue.async(group: group) { ... }
someOtherQueue.async(group: group) { ... } 

if group.wait(timeout: .now() + 60) == .timedOut { 
    print("The jobs didn’t finish in 60 seconds") 
}
```

In the above example, you’re giving the tasks up to 60 seconds to complete their work before wait returns.

**Note**: Remember, this blocks the current thread; never **ever** call wait on the main queue.