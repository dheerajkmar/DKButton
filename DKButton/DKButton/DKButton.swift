//
//  DKButton.swift
//  DKButton
//
//  Created by Dheeraj Kumar on 22/07/20.
//  Copyright © 2020 Conduent. All rights reserved.
//

import UIKit

@IBDesignable
class DKButton: UIButton {
    
    // MARK: - Variables
    
    ///Gradient start and end points
    fileprivate var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
    fileprivate var endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)
    
    ///Gradient layer
    public lazy var gradientLayer: CAGradientLayer = {
        return CAGradientLayer()
    }()
        
    
    // MARK: - Gradiennt layer
    
    /// Gradient start color.
    @IBInspectable public var startColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
        
    /// Gradient end color.
    @IBInspectable public var endColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// Gradient start location. It's value lies between 0.0 to 1.0. If the width of a button is 100px and gradiant start location is assigned to 0.05, gradiant start point will be 5px.
    @IBInspectable public var startLocation: Double = 0.05 {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// Gradient end location. It's value lies between 0.0 to 1.0. If the width of a button is 100px and gradiant start point is 0.05 and end point is 0.95 then the gradiant will start from 5px and end at 95px.
    @IBInspectable public var endLocation: Double = 0.95 {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// Gradient angle. This property is used to set the gradiant direction. 0 degree is horizontal gradient from left to right.
    @IBInspectable public var gradientAngle: CGFloat = 0.0 {
        didSet {
            let gradientPoints = gradientAngle.gradientPointsFromAngle()
            startPoint = gradientPoints.startPoint
            endPoint = gradientPoints.endPoint
            setNeedsLayout()
        }
    }
        
    // MARK: - Custom shape
    
    /// This property is used to set custom shape for the button. If it's true then you can set either corner of the button.
    @IBInspectable var shapeType: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// This property is used to set custom shape for the button. If it's true then you can set either corner of the button.
    @IBInspectable var cropEdge: CGFloat = 10.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// This property is used to insert space between characters.
    @IBInspectable public var characterSpacing: Double = 1.0 {
        didSet {
            addCharacterSpacing(kernValue: characterSpacing)
        }
    }
    
    // MARK: - Text property
    
    /// This property is used to inset space between characters.
    @IBInspectable public var htmlText: String? {
        didSet {
            setHTMLText()
        }
    }
    
    // MARK:- Life-cycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateGradiantLayer()
    }
    
    public override  func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
    }
    
    // MARK: - Private methods
    
    private func setup() {
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /// This method is used to update the gradiant start and end points.
    private func updatePoints(startPoint: CGPoint, endPoint: CGPoint) {
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }
        
    /// This method is used to update the gradiant color of gradiant layer.
    private func updateColor(startColor: UIColor?, endColor: UIColor?) {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    
    /// This method is used to update the start and end location of gradiant.
    private func updateLocations(startLocation: Double, endLocation: Double) {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    
    /// Update gradiant layer.
    private func updateGradiantLayer() -> Void {
        gradientLayer.frame = bounds
        gradientLayer.borderColor = layer.borderColor
        gradientLayer.borderWidth = layer.borderWidth
        gradientLayer.cornerRadius = layer.cornerRadius
        updatePoints(startPoint: startPoint, endPoint: endPoint)
        updateColor(startColor: startColor, endColor: endColor)
        updateLocations(startLocation: startLocation, endLocation: endLocation)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
        
    private func setHTMLText() {
        if let html = htmlText {
            //added support for utf16/non-ascii
            let encoding = String.Encoding.utf16
            guard let data = html.data(using: encoding) else {
                fatalError("UTF16 is not supported!!!")
            }
            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                self.setAttributedTitle(attributedString, for: .normal)
            }
        }
    }
        
}

extension UIButton {
    func addCharacterSpacing(kernValue: Double = 0.0) {
        if let labelText = self.titleLabel?.text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            self.setAttributedTitle(attributedString, for: UIControl.State())
        }
    }
}
