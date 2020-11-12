//
//  CustomButton.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 29/11/19.
//  Copyright © 2019 Ajie Pramono Arganata. All rights reserved.
//

import UIKit
import ChameleonFramework
import Material
import PureLayout

public class CustomButton: Button {
    // MARK: Properties
    private var isBold = false
    private var cornerRadius: CGFloat = 6.0 //default radius
    private var borderWidth: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    private var shadow: CGFloat = 1 //default
    private var shadowRadius: CGFloat = 2.0
    private var gradientColorTop: UIColor?
    private var gradientColorBottom: UIColor?
    private var isGradientTopBottom = true
    private var viewLoader: UIView?
    public var buttonTitle = ""
    private var currentFontColor: UIColor = .white
    private var currentBackgroundColor: UIColor? = .clear
    private var handlerTouchUpInside: ((UIView)->())?
    
    // MARK: Function
    
    public func applyStyle(title: String, font: UIFont?, fontColor: UIColor, backgroundColor: UIColor? = nil, isGradientTopBottom: Bool = false, gradientColorTop: UIColor? = nil, gradientColorBottom: UIColor? = nil, shadow: CGFloat = 1, borderColor: UIColor? = nil, borderWidth: CGFloat = 0, borderRadius: CGFloat = 0) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.titleColor = fontColor
        self.currentFontColor = fontColor
        self.buttonTitle = self.currentTitle ?? ""
        self.currentBackgroundColor = backgroundColor
        self.gradientColorTop = gradientColorTop
        self.gradientColorBottom = gradientColorBottom
        self.pulseColor = .lightGray
        self.shadow = shadow
        guard let gradientColorTop = self.gradientColorTop, let gradientColorBottom = self.gradientColorBottom else {
            self.backgroundColor = self.currentBackgroundColor
            return
        }
        self.borderWidth = borderWidth
        self.layer.borderWidth = self.borderWidth
        self.borderColor = borderColor
        self.layer.borderColor = self.borderColor?.cgColor
        self.cornerRadius = borderRadius
        self.layer.cornerRadius = self.cornerRadius
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.backgroundColor = UIColor(gradientStyle: self.isGradientTopBottom ? .topToBottom : .leftToRight, withFrame: self.bounds, andColors: [gradientColorBottom, gradientColorTop])
            self.currentBackgroundColor = self.backgroundColor
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: shadow)
        layer.shadowOpacity = shadow == 0 ? 0 : 0.4
        layer.shadowRadius = shadow == 0 ? 0 : shadowRadius
        layer.shadowPath = shadowPath.cgPath
    }
    
    public func setCorner(radius: CGFloat) {
        cornerRadius = radius
        layer.cornerRadius = cornerRadius
    }
    
    public func setBorderWidth(value: CGFloat) {
        borderWidth = value
        layer.borderWidth = borderWidth
    }
    
    public func setBorderColor(value: UIColor) {
        borderColor = value
        layer.borderColor = borderColor?.cgColor
    }
    
    public func setLoading(isLoad: Bool) {
        if isLoad {
            self.viewLoader?.removeFromSuperview()
            let size = self.frame.size
            let view = UIStackView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let progress = UIActivityIndicatorView(style: .gray)
            view.addArrangedSubview(progress)
            progress.startAnimating()
            self.addSubview(view)
            self.viewLoader = view
            self.isEnabled = false
            self.setTitle(nil, for: .normal)
        } else {
            self.viewLoader?.removeFromSuperview()
            self.isEnabled = true
            self.setTitle(self.buttonTitle, for: .normal)
        }
    }
    
    public func activeOrDeactive(value: Bool) {
        self.backgroundColor = value ? self.currentBackgroundColor : .lightGray
        self.titleColor = value ? currentFontColor : .darkGray
        self.isEnabled = value
    }
    
    public func addHandlerButton(handler: ((UIView)->())?) {
        handlerTouchUpInside = handler
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc private func touchUpInside() {
        self.handlerTouchUpInside?(self)
    }
}
