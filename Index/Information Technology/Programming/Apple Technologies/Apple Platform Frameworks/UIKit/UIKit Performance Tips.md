# UIKit Performance Tips

[iOS Performance tips you probably didn't know (from an ex-Apple engineer) · Rony's blog](https://www.fadel.io/blog/posts/ios-performance-tips-you-probably-didnt-know/)

## **UILable is heavy**

So you should should `nil` content of yours `UILabels` because they can be very large (it’s only worth it on big amounts of data)

So to free up potentially megabytes of memory:

- Nilify labels’ **text** if you set them to hidden and only occasionally display them
- Nilify labels’ **text** if they’re displayed in `UITableView`**/**`UICollectionView` cells, in:
    - `tableView(_:didEndDisplaying:forRowAt:)`
    - `collectionView(_:didEndDisplaying:forItemAt:)`

## **Prefer serial queues over concurrent**

Because if thread pool is empty GCD will create new threads and this operations is a quite heavy

## Don’t use **DispatchQueue.global()** because it’s QoS is not obvious

![](UIKit%20Performance%20Tips/The_concurrent_queues_you_get_from_dispatch_get_global_queue_are_bad_at_forwarding_QoS_information.png)

So if it’s possible you should create internal serial queues with meaningful names