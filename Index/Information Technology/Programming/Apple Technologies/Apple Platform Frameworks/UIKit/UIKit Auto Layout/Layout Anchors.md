# Layout Anchors

[Snap Kit. More Beautiful DSL](http://snapkit.io/docs/)

Allows us to write less code when we need to set constraints in code

Constraint in code without anchors

![[Layout Anchors/let_constraint__NSLayoutConstraint(.png]]

And with

![[Layout Anchors/equalTo_button.heightAnchor.png]]

Than we need to activate an anchor

![[Layout Anchors/Both_of_these_are_valid_ways_to_activate_a_constraint.png]]

Each anchor can only form a constraint with an anchor of the same axis

## Example of using anchors to place button and label

![[Layout Anchors/let_button__UIButton().png]].png)

code

![[Layout Anchors/SSSSSSS.png]]

result

## Layout guides

- `layoutMarginsGuide`: Set constraints and keep the layout margins as spacing
- `readableContentGuide`: Constraints the width to a size that is easy for the user to read
- `safeAreaLayoutGuide`: Represents the portion of your view that is unobscured by bars and other content

```swift
let constraints = [
    outerSquare.topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor),
    outerSquare.leftAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leftAnchor),
    viewController.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: outerSquare.bottomAnchor),
    viewController.view.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: outerSquare.rightAnchor)
]
```