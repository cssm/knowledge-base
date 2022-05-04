- **Notes**
	- [Layout Anchors](UIKit%20Auto%20Layout/Layout%20Anchors.md)
- **Links**
	- [Advanced Auto Layout Toolbox · objc.io](https://www.objc.io/issues/3-views/advanced-auto-layout-toolbox/)
	- [The Auto Layout cheat sheet – Hacking with Swift](https://www.hackingwithswift.com/articles/140/the-auto-layout-cheat-sheet)
	- [Математические основы Auto Layout / Хабр](https://habr.com/ru/company/oleg-bunin/blog/437584/)
	- [The Auto Layout Comprehendium](https://medium.com/@PhiJay/the-auto-layout-comprehendium-%EF%B8%8F-6d7e2105bf70)
- *DSL's*
	- [SnapKit/SnapKit: A Swift Autolayout DSL for iOS & OS X](https://github.com/SnapKit/SnapKit)
	- [robb/Cartography: A declarative Auto Layout DSL for Swift](https://github.com/robb/Cartography)


## Constraints

![](UIKit%20Auto%20Layout/RedView._Leading.png)

Minimum 2 constraints on each dimension

## **`translatesAutoresizingMaskIntoConstraints`**

```swift
// for views you create in code 
buttonInCode.translatesAutoresizingMaskIntoConstraints = false
```

When **`translatesAutoresizingMaskIntoConstraints`**  is set to `true` then Auto Layout will create default constraints to calculate size and position of the view.

```swift
viewInInterfaceBuilder.translatesAutoresizingMaskIntoConstraints == false
viewInCode.translatesAutoresizingMaskIntoConstraints == true
```

## Constraints Priorities

Defines that some of constraints is not required 

If constraint with lower priority is conflicting with constraint with higher priority then constraint with lower priority will not taken into account.

## Intrinsic Content Size

It's a natural size of the view defined by it content. 

It's implemented as constraint with low priority. 

Because of it we do not need to set all constraint. Regularly we can just set constraints for position so width and height will be resolved from Intrinsic Content Size constraint

## Compression resistance and content hugging

![](UIKit%20Auto%20Layout/Untitled.png)

The first constraint (with the >= sign) is called **compression resistance** because it says that the view’s width should not be smaller than its intrinsic content width.

Setting a higher priority value means that we don’t want the view to shrink smaller than the intrinsic content size.

The second constraint (with the <= sign) is called **content hugging** because it says that the view’s width should not be greater than its intrinsic content width. 

Setting a higher priority value indicates that we don’t want the view to grow larger than its content.

## Layout Process

`layoutSubviews()` **(Do not call it directly)** - Method in which auto layout resolves frames of view

```swift
override func layoutSubviews() {
    // Let the layout engine resolve your constraints:
    super.layoutSubviews()
    // Now you can manually change the frames of any subview.
}
```

`setNeedsLayout()` - marks layout as invalid. Update view layout (and all subviews) on the next update cycle

`layoutIfNeeded()` - recalculate layout of views that was invalidated with `setNeedsLayout()`

## Updating constraints

We need to call `updateConstraints()`  and `updateConstraintsIfNeeded()` only in cases when:

- change a huge number of constraints at the same time
- redundantly switch the same constraints on and off multiple times in a row

To do so we overrides `updateConstraints()` and do all constraints change in it

In other cases documentations says

> If you want to change a constraint in response to a button tap, make that change directly in the button’s action method.
>