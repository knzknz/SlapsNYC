//
//  CustomCards.swift
//  SlapsNYC
//
//  Created by C4Q on 6/4/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomCards: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0
    
    @IBInspectable
    var shadowcolor: UIColor? = UIColor.green
    
    @IBInspectable
    var shadowOffsetWidth: Int = 0
    
    @IBInspectable
    var shadowOffsetHeight: Int = 1
    
    @IBInspectable
    var shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowcolor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        
        layer.shadowOpacity = shadowOpacity
        layer.backgroundColor = UIColor.white.cgColor
    }
    
}

