- [UIKit updating collections with animation](UIKit%20updating%20collections%20with%20animation.md)
- [UIKit UI Collections Cells](UIKit%20UI%20Collections%20Cells.md)
- [UIKit Collections Scroll Optimizations](UIKit%20Collections%20Scroll%20Optimizations.md)

- header or footer of table view should be set only on  `viewDidLoad` , `viewDiDAppear` etc. but not in `loadView`
- Pagination and pre-loading
	- [Prefetching for UITableView | Andrey Gordeev](https://andreygordeev.com/2017/02/20/uitableview-prefetching/)
		- Prefetching depends on `dataSource` items count
- [Embedding UITextView inside UITableViewCell](https://medium.com/@georgetsifrikas/embedding-uitextview-inside-uitableviewcell-9a28794daf01)
- [Detect Tap on Background of UITableView](https://stackoverflow.com/questions/24141254/how-to-detect-tap-on-clear-part-of-uitableview)
- [Особенности работы метода UITableView.scrollToRow | by Artem Kirillov | Яндекс.Карты Mobile | Medium](https://medium.com/yandex-maps-mobile/особенности-работы-метода-uitableview-scrolltorow-a07ef22ef16b)


## **Self-sizing cells**

Setting the number of lines is very important for dynamically sized cells. A label with its number of lines **set to 0 will grow based on how much text it is showing**. A label with number of lines set to any other number will truncate the text once it’s out of available lines.

```swift
tableView.rowHeight = UITableView.automaticDimension
tableView.estimatedRowHeight = 600
```

When you set the row height as `UITableViewAutomaticDimension`, the table view is told to use the Auto Layout constraints and the contents of its cells to determine each cell’s height.

In order for the table view to do this, you must also provide an `estimatedRowHeight`.

Setting a higher priority on **content hugging** means that the view will resist growing larger than its intrinsic size. You told the storyboard to make your cell with 450 points tall, which is larger than the intrinsic size of your views. Setting a vertical content hugging priority tells Xcode which view to expand if it needs to fill the space.


## Custom Cells

`register(_:forCellReuseIdentifier:)` guarantees your table view will return a cell of the correct type when the **Cell** reuseIdentifier is provided to the dequeue method.

```swift
tableView.register(
	CellType.self, 
	forCellReuseIdentifier: "cellReuseIdentifier"
)
```

## Remove Rows Under Cells

```swift
tableView.tableFooterView = .init()
```

## Row Selection

### Highlight Row Only On Tap

Implement `setHighlighted` in custom cell **or** impement `didSelectRowAtIndexPath` and `didDeselectRowAtIndexPath` to set **highlighted color** of cell

```swift
didSelectRow { indexPath in
	tableView.deselectRow(at: indexPath, animated: true)
}
```

## Adding Headers and Footers to Table Sections
- [Christian Selig on Twitter: "Okay per @johnnie_tseng and @kylehickinson, despite the method signature you want to subclass UITableViewHeaderFooterView, and then add/constrain it to its contentView. 🎉 Gist: https://t.co/kzfGKFdFg0 https://t.co/hJTQUtLlEs" / Twitter](https://twitter.com/ChristianSelig/status/1491808240702791682)

```swift
.willDisplayHeaderView { view, section in
	guard let header = view as? UITableViewHeaderFooterView else { return }
  header.textLabel?.text = "Text"
	...
}
```

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/adding_headers_and_footers_to_table_sections)