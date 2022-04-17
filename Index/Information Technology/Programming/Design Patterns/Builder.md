# Builder

Main goal of this pattern is that object should be configured by **builder class** not by class itself

```swift
// instead of this
let view = ArticleView()
view.titleLabel.text = article.title
view.subtitleLabel.text = article.subtitle
view.imageView.image = article.image

// should be this
let view = ArticleViewBuilder()
    .withTitle(article.title)
    .withSubtitle(article.subtitle)
    .withImage(article.image)
    .build() // finish configuration by calling build
```

We can abstract the phases of building by creating `Director` class that will handle builder object which conforms to some `Builder` protocol

## Usecases

- When we want to reduce amount of constructors
    
    ```swift
    class Pizza {
        Pizza(int size) { ... }
        Pizza(int size, boolean cheese) { ... }
        Pizza(int size, boolean cheese, boolean pepperoni) { ... }
        // ...
    ```
    
- When we want to configure different objects that are same in phases of building