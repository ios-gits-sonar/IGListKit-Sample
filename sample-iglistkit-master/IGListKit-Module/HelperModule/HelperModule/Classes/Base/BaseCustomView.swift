//
//  BaseCustomView.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 26/09/19.
//

import UIKit
import PureLayout

/// A Class of Base Custom View
open class BaseCustomView: UIView {
    // MARK: Properties
    /// Setup constraint
    public var shouldSetupConstraints = true
    /// A name of a view
    private static var NAME: String {
        let type = String(describing: self)
        return type
    }
    
    // MARK: Function
    /**
     */
    public class func instantiateViewFromNib() -> BaseCustomView {
        let view = UINib(nibName: NAME, bundle: self.bundle).instantiate(withOwner: nil, options: [:])[0] as! BaseCustomView
        return view
    }
    
    public func instantiateView(from view: UIView) {
        view.addSubview(self)
        self.autoPinEdgesToSuperviewEdges(with: .zero)
    }
    
    public func openDialog(at superview: UIView) {
        superview.addSubview(self)
        self.autoPinEdgesToSuperviewEdges(with: .zero)
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 1.0
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        })
    }
    
    public func configureView(data: Any?) {}
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: BaseCustomView.self)
        let bundleURL = podBundle.url(forResource: "HelperModule", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}
