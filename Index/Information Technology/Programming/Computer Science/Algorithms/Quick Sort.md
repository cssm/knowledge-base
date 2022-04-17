# Quick Sort

```swift
func quickSort<T: Comparable>(of array: [T]) -> [T] {
    guard let pivot = array.randomElement() else { return [] }
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    return quickSort(of: less) + equal + quickSort(of: greater)
}

print(quickSort(of: [4, 4, 2, 2, 1, 3, 15, -4]))
```