# UIStackView

`removeArrangedSubview` only removes from array but view itself still a subview of stackview

## Alignment

The alignment property determines how a stack view lays out its views **perpendicular to its axis**.

For a **vertical** stack view, the possible values are **Fill, Leading, Center, and Trailing**.

The horizontal stack view has **.top** instead of .**leading** and has **.bottom** instead of .**trailing**. There are also two more properties that are valid only in the horizontal direction, **.firstBaseline** and .**lastBaseline**.

### Vertical axis

![[UIStackView/Screen_Shot_2020-09-19_at_14.29.33.png]]

### Horizontal axis

![[UIStackView/Screen_Shot_2020-09-19_at_14.29.09.png]]

## Distribution

![[UIStackView/Screen_Shot_2020-09-19_at_14.31.21.png]]

## Code snippets

### Add margins to stack view

When `isLayoutMarginsRelativeArrangement` property is `true`, the stack view will layout its arranged views relative to its layout margins.

```swift
stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
stackView.isLayoutMarginsRelativeArrangement = true
```