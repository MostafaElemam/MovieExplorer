//
//  GradientDirection.swift
//  MovieExplorer
//
//  Created by Mostafa Elemam on 17/06/2025.
//

import UIKit

extension UIView {
    //IBInspectable Variables
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            if let colorCG = layer.borderColor {
                return UIColor(cgColor: colorCG)
            }
            return nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    //Functions
    func roundedBottomOnly() {
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    func roundedTopOnly() {
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    func roundedLeftOnly() {
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    func roundedRightOnly() {
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    func roundCorners(corners: [UIRectCorner], radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        
        var maskedCorners = CACornerMask()
        for corner in corners {
            switch corner {
            case .topRight:
                maskedCorners.insert(.layerMaxXMinYCorner)
            case .topLeft:
                maskedCorners.insert(.layerMinXMinYCorner)
            case .bottomLeft:
                maskedCorners.insert(.layerMinXMaxYCorner)
            case .bottomRight:
                maskedCorners.insert(.layerMaxXMaxYCorner)
            default:
                //all
                return
            }
        }
        layer.maskedCorners = maskedCorners
    }
    /// SwifterSwift: Fade in view.
    func fadeIn(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: completion)
    }
    
    /// SwifterSwift: Fade out view.
    func fadeOut(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: completion)
    }
    /// SwifterSwift: Make the view blurry.
    func blur(behindView: Bool = true, withStyle style: UIBlurEffect.Style = .light, alpha: CGFloat = 1) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        blurEffectView.isUserInteractionEnabled = false
        blurEffectView.alpha = alpha
        
        if behindView {
            insertSubview(blurEffectView, at: 0)
        } else {
            addSubview(blurEffectView)
        }
        clipsToBounds = true
    }
    
    /// SwifterSwift: Removes the applied blur effect from the `UIView`.
    func removeBlur() {
        subviews
            .lazy
            .compactMap { $0 as? UIVisualEffectView }
            .filter { $0.effect is UIBlurEffect }
            .forEach { $0.removeFromSuperview() }
    }
    /// AddBottomBorder to View.
    func addBottomBorderWithColor(color: UIColor, width: CGFloat = 1.0) {
        if let sublayers = layer.sublayers {
            for layer in sublayers {
                if layer.name == "bottomBorder" {
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRectMake(0, frame.size.height - width, frame.size.width, width)
        border.name = "bottomBorder"
        layer.addSublayer(border)
    }
    /// Remove Bottom Border
    func removeBottomBorder() {
        if let sublayers = layer.sublayers {
            for layer in sublayers {
                if layer.name == "bottomBorder" {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    /// Add Top and bottom Borders
    func addTopAndBottomBorders(with color: UIColor, borderWidth: CGFloat) {
        // Top border
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: borderWidth)
        topBorder.backgroundColor = color.cgColor
        self.layer.addSublayer(topBorder)
        
        // Bottom border
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: borderWidth)
        bottomBorder.backgroundColor = color.cgColor
        self.layer.addSublayer(bottomBorder)
    }
    // SwifterSwift: Add gradient directions
    struct GradientDirection {
        public static let topToBottom = GradientDirection(startPoint: CGPoint(x: 0.5, y: 0.0),
                                                          endPoint: CGPoint(x: 0.5, y: 1.0))
        public static let bottomToTop = GradientDirection(startPoint: CGPoint(x: 0.5, y: 1.0),
                                                          endPoint: CGPoint(x: 0.5, y: 0.0))
        public static let leftToRight = GradientDirection(startPoint: CGPoint(x: 0.0, y: 0.5),
                                                          endPoint: CGPoint(x: 1.0, y: 0.5))
        public static let rightToLeft = GradientDirection(startPoint: CGPoint(x: 1.0, y: 0.5),
                                                          endPoint: CGPoint(x: 0.0, y: 0.5))
        
        public let startPoint: CGPoint
        public let endPoint: CGPoint
        
        public init(startPoint: CGPoint, endPoint: CGPoint) {
            self.startPoint = startPoint
            self.endPoint = endPoint
        }
    }
    ///Apply Gradient
    func addGradient(colors: [UIColor], locations: [CGFloat] = [0.0, 1.0], direction: GradientDirection) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        gradientLayer.locations = locations.map { NSNumber(value: $0) }
        gradientLayer.startPoint = direction.startPoint
        gradientLayer.endPoint = direction.endPoint
        layer.insertSublayer(gradientLayer, at: 0)
    }
    ///Add Shadow to View.
    func addShadow(
        ofColor color: UIColor = .black,
        radius: CGFloat = 3,
        offset: CGSize = .zero,
        opacity: Float = 0.5) {
            layer.shadowColor = color.cgColor
            layer.shadowOffset = offset
            layer.shadowRadius = radius
            layer.shadowOpacity = opacity
            layer.masksToBounds = false
        }
    ///Make View Circular.
    func makeCircle(diameter: CGFloat) {
        clipsToBounds = true
        bounds.size.height = diameter
        bounds.size.width = diameter
        layer.cornerRadius = diameter / 2
    }
    ///Add dash Border
    func addDashedBorder(color: UIColor, lineWidth: CGFloat, dashPattern: [NSNumber], cornerRadius: CGFloat) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineDashPattern = dashPattern
        shapeLayer.fillColor = nil
        shapeLayer.frame = self.bounds
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
        layer.addSublayer(shapeLayer)
    }
    /// SwifterSwift: Load view of a certain type from nib
    ///
    /// - Parameters:
    ///   - withClass: UIView type.
    ///   - bundle: bundle of nib (default is nil).
    /// - Returns: UIView
    class func loadFromNib<T: UIView>(withClass name: T.Type, bundle: Bundle? = nil) -> T {
        let named = String(describing: name)
        guard let view = UINib(nibName: named, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? T else {
            fatalError("First element in xib file \(named) is not of type \(named)")
        }
        return view
    }
}
