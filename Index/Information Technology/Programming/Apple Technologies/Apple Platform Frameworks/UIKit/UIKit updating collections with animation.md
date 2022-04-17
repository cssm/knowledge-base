## Updating cells

```swift
// some change in dataSource happend...
collectionView.performBatchUpdates { [weak self, previousCount, currentCount] _self in
    let indexPaths = (previousCount..<currentCount)
												.map { IndexPath(item: $0, section: 0) }
    self?.collectionView.insertItems(at: indexPaths)
}
```

## Updating sections

```swift
sections.insert(.init(), at: 0)
contentView.tableView.performBatchUpdates {
	self.contentView.tableView.insertSections(.init(integer: 0), with: .top)
}
```