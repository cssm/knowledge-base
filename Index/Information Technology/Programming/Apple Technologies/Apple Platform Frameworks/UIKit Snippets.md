- `ProgressIndicatorView`
```swift
public final class ProgressIndicatorView: UIView {

    public var lineColor: UIColor = .white {
        willSet { progressLayer.strokeColor = newValue.cgColor }
    }
    
    public var lineWidth: CGFloat = 4 {
        willSet { progressLayer.lineWidth = newValue }
    }
    
    private let rotation: CGFloat = 2 * .pi
    private let animationKey = "rotatingAnimation"
        
    private lazy var progressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineCap = .round
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = lineColor.cgColor
        layer.lineWidth = lineWidth
        return layer
    }()
    
    public func startAnimating(duration: CFTimeInterval = 0.6) {
        let spinAnimation = CABasicAnimation(keyPath: "transform.rotation")
        spinAnimation.duration = duration
        spinAnimation.byValue = rotation
        spinAnimation.repeatCount = .infinity
        progressLayer.add(spinAnimation, forKey: animationKey)
    }
    
    public func stopAnimating() {
        progressLayer.removeAnimation(forKey: animationKey)
    }
    
    convenience init() {
        self.init(frame: .zero)
        self.layer.addSublayer(progressLayer)
    }
    
    convenience init(lineColor: UIColor) {
        self.init(frame: .zero)
        self.lineColor = lineColor
        self.layer.addSublayer(progressLayer)
    }
    
    convenience init(lineColor: UIColor, lineWidth: CGFloat) {
        self.init(frame: .zero)
        self.lineColor = lineColor
        self.lineWidth = lineWidth
        self.layer.addSublayer(progressLayer)
    }
    
    public override var intrinsicContentSize: CGSize { 
        CGSize(width: 35, height: 35) 
    }
        
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.progressLayer.frame.origin = CGPoint(x: bounds.midX, y: bounds.midY)
        self.progressLayer.path = UIBezierPath(
            arcCenter: .zero,
            radius: bounds.size.height / 2,
            startAngle: .pi / 3,
            endAngle: 2 * .pi - .pi / 3,
            clockwise: true
        ).cgPath
    }
}

```