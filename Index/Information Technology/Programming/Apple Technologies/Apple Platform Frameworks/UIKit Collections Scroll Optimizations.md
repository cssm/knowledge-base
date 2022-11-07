- [Дмитрий Игнатьев – Плавный скролл онлайн гипермаркета](https://www.youtube.com/watch?v=e1tEScZIiTg)

## Scroll optimisation

### **> iOS7**

```swift
tableView.estimatedRowHeight = ... // Estimated default row height
tableView.rowHeight = UITableView.automaticDimension
```

### **On iOS7**

We need to calculate heightForRowAt:

To make it more efficient:

- add caching for this heights and do not calculate them each time
- Pre calculate all heights at once (estimatedRowHeight analog)