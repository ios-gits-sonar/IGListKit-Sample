//
//  CardView.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 29/11/19.
//  Copyright © 2019 Ajie Pramono Arganata. All rights reserved.
//

import UIKit

public class CardView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 1 //default
    @IBInspectable var shadow: CGFloat = 1 //default
    @IBInspectable var shadowRadius: CGFloat = 2.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    public init(frame: CGRect, cornerRadius: CGFloat, shadow: CGFloat = 1) {
        self.cornerRadius = cornerRadius
        self.shadow = shadow
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: shadow)
        layer.shadowOpacity = shadow == 0 ? 0 : 0.4
        layer.shadowRadius = shadow == 0 ? 0 : shadowRadius
        layer.shadowPath = shadowPath.cgPath
        layer.borderWidth = borderWidth
    }
    
    public func reload() {
        setNeedsDisplay()
        layer.displayIfNeeded()
    }
}
