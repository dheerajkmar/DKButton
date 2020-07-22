//
//  UIView+Layer.swift
//  CMButtonDemo
//
//  Created by Dheeraj Kumar on 20/06/20.
//  Copyright © 2020 Dheeraj Kumar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
            
    /// This property is used to set the corner radius of the button. By default it's value is zero.
    @IBInspectable public var cornerRadius: Double {
        get { return Double(self.layer.cornerRadius) }
        set { self.layer.cornerRadius = CGFloat(newValue) }
    }
    
    /// This property is used to set the border width of the button. By default it's value is zero.
    @IBInspectable public var borderWidth: Double {
        get { return Double(self.layer.borderWidth) }
        set { self.layer.borderWidth = CGFloat(newValue) }
    }
    
    /// This property is used to set the border color of the button.
    @IBInspectable public var borderColor: UIColor? {
        get { return UIColor(cgColor: self.layer.borderColor!) }
        set { self.layer.borderColor = newValue?.cgColor }
    }
    
    /// This property is used the set the shadow color of the button.
    @IBInspectable public var shadowColor: UIColor? {
        get { return UIColor(cgColor: self.layer.shadowColor!) }
        set { self.layer.shadowColor = newValue?.cgColor }
    }
    
    /// This property is used to set the shadow opacity of the button. It's value lies between 0.0 (transparent) to 1.0 (opaque).
    @IBInspectable public var shadowOpacity: Float {
        get { return self.layer.shadowOpacity }
        set { self.layer.shadowOpacity = newValue }
    }
    
    /// This property is used to set the shadow offset of the button.
    @IBInspectable public var shadowOffset: CGSize {
        get { return self.layer.shadowOffset }
        set { self.layer.shadowOffset = newValue }
    }
    
    /// This property is used to set the shadow radius of the button
    @IBInspectable var shadowRadius: CGFloat {
        get { return self.layer.shadowRadius }
        set { self.layer.shadowRadius = newValue }
    }
    
}
