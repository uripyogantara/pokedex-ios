//
//  UIViewExtention.swift
//  Pokedex
//
//  Created by LPT 528 on 2/4/20.
//

import Foundation
import UIKit

extension UIView{
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x:1.0, y:0.5)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func roundCorners(corners: UIRectCorner, cornerRadius: CGFloat) {
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
    
    func addShadow(shadowColor: UIColor, shadowRadius: CGFloat) {
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = 1.0
    }
}
