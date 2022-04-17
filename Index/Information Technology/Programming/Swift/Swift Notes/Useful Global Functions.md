# Useful Global Functions

## **`sequence()`**

```swift
// Turn this
var currentView: UIView? = self
while currentView != nil {
	currentView?.backgroundColor = .green
	currentView = currentView?.superview
}

// Into this
for view in sequence(first: self, next: { $0.superview } ) {
	view.backgroundColor = .green
}
```

## **`repeatElement()`**

Use it when you need more efficient replacing in collection (no overhead to create buffer array)

```swift
// Instead of this
array.replaceSubrange(
		2...7, 
		with: [[Int]]
)

// Use this
array.replaceSubrange(
		2...7, 
		with: repeatElement(1, count: 6)
)
```

## **`stride()`**

You can make any type satiable by conforming to **Stideable** protocol

## **`isKnownUniquelyReferenced()`**

allows as to check is this class has only one referance