//
//  CGFloat+GradientPoints.swift
//  CMButtonExample
//
//  Created by Dheeraj Kumar on 01/07/20.
//  Copyright © 2020 Conduent. All rights reserved.
//

import UIKit

extension CGFloat {
    
    /// This method is used to calculate the start and end point of gradient layer for provide angle.
    /// - Parameter angle: CGFloat gradient angle that decides the direction of gradient layer.
    func gradientPointsFromAngle() -> (startPoint: CGPoint, endPoint: CGPoint) {
        
        var startPoint = CGPoint(x: 0.0, y: 0.0)
        var endPoint = CGPoint(x: 1.0, y: 1.0)
        
        let alpha: Float = Float(self / 360)
        let startPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
            2
        )
        let startPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0) / 2)),
            2
        )
        let endPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
            2
        )
        let endPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
            2
        )

        startPoint = CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY))
        endPoint = CGPoint(x: CGFloat(endPointX),y: CGFloat(endPointY))
        
        return (startPoint: startPoint, endPoint: endPoint)
    }
    
    /// Private function to aid with the math when calculating the gradient angle
    func tanx(_ 𝜽: CGFloat) -> CGFloat {
        return tan(𝜽 * CGFloat.pi / 180)
    }
    
}
