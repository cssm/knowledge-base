- **Notes**
	- We can add image to text by using `NSTextAttachment`
		```swift
		 guard let arrowImage = UIImage(systemName: .arrowDown) else { return }
		 let attributedString = NSMutableAttributedString(
		   attachment: .init(image: arrowImage).configured { $0
			 .bounds(.init(x: -4, y: -4, width: 16, height: 16))
		   }
		 )
		 attributedString.append(.init(string: "Some text after image"))
		 label.attributedText = attributedString
		```
- **Links**
	- [UILabel | Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uilabel)
	- [Магия UILabel или приватное API Autolayout | by Alexander Goremykin | Яндекс.Карты Mobile | Medium](https://medium.com/yandex-maps-mobile/uilabel-magic-2c83bc62a0db)


## How to change text trimming behaviour

```swift
let label = UILabel()
label.lineBreakMode = .byTruncatingTail
```

## Number of lines

```swift
let label = UILabel()
label.numberOfLines = 0 // any number of lines
label.numberOfLines = 1 // default, only one line 
```

## Shrink font size to fit in parent view

> To calculate scale factor take desirable font size and divide it to current font size.
> e.g your current font size is 13 and you want to shrink it to 11 -> 11 / 13 ~= 0.84 - that will be your `minimumScaleFactor`

```swift
let label = UILabel()
label.adjustFontSizeToFitWidth = true
label.minimumScaleFactor = 0.5  
```

## Add spacing between lines

```swift
let label = UILabel()
let attributedString = NSMutableAttributedString(string: "welcome\nto edudo".uppercased())
let p = NSMutableParagraphStyle()
p.lineSpacing = 3
attributedString.addAttribute(.paragraphStyle, value: p)
label.attributedText = attributedString
```

## Highlight part of text

```swift
let label = UILabel()
let text = "By tapping on Start, I agree that I have read and agree to the Terms of Use and Privacy Policy."
let mutString = NSMutableAttributedString(string: text)
let range = (text as NSString).range(of: "Terms of Use")
let attributes: [NSAttributedString.Key: Any] = [
		.foregroundColor: UIColor.white,
		.underlineStyle: NSUnderlineStyle.single.rawValue
]
mutString.addAttributes(attributes, range: range)
label.attributedText = mutString
```

## Kerning

It's a spacing between letters

```swift
public extension UILabel {
    
    var kerning: CGFloat {
        get {
            guard let attributedString = self.attributedText else { return 0 }
            let text = attributedString.string
            var range = NSMakeRange(0, text.count)
            guard
                let value = attributedString.attribute(.kern, at: 0, effectiveRange: &range),
                let kerning = value as? NSNumber
            else {
                return 0
            }
            return CGFloat(kerning.floatValue)
        }
        set {
            guard let text = self.text else { return }
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(.kern, value: newValue, range: NSMakeRange(0, text.count))
            self.attributedText = attributedString
        }
    }
 
}
```