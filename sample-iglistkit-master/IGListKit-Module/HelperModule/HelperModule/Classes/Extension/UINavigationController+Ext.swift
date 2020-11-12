//
//  UINavigationController+Exntension.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 20/10/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit

public extension UINavigationController {
    static var statusbarView: UIView?
    
    func configColorBar(colorBar: UIColor?, colorTitle: UIColor?, colorBarButton: UIColor?, alpha: CGFloat = 1, isTranslucent: Bool = false) {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
        self.navigationBar.setBackgroundImage(alpha == 1 ? nil : UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = alpha == 1 ? nil : UIImage()
        self.navigationBar.tintColor = colorBarButton
        self.navigationBar.isTranslucent = isTranslucent
        self.navigationBar.barTintColor = colorBar?.withAlphaComponent(alpha)
        self.navigationBar.backgroundColor = colorBar?.withAlphaComponent(alpha)
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorTitle ?? UIColor.black
        ]
        if #available(iOS 13.0, *) {
            if let navigation = self.view {
                UINavigationController.statusbarView = navigation.subviews.first { (view) -> Bool in
                    return view.tag == 20192020
                }
                if UINavigationController.statusbarView == nil {
                    UINavigationController.statusbarView = UIView()
                    UINavigationController.statusbarView?.tag = 20192020
                    navigation.addSubview(UINavigationController.statusbarView!)
                    UINavigationController.statusbarView?.translatesAutoresizingMaskIntoConstraints = false
                    UINavigationController.statusbarView?.heightAnchor
                        .constraint(equalToConstant: statusBarHeight).isActive = true
                    UINavigationController.statusbarView?.widthAnchor
                        .constraint(equalTo: navigation.widthAnchor, multiplier: 1.0).isActive = true
                    UINavigationController.statusbarView?.topAnchor
                        .constraint(equalTo: navigation.topAnchor).isActive = true
                    UINavigationController.statusbarView?.centerXAnchor
                        .constraint(equalTo: navigation.centerXAnchor).isActive = true
                }
                UINavigationController.statusbarView?.backgroundColor = alpha == 1 ? .clear : colorBar?.withAlphaComponent(alpha)
            }
        } else {
            let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
            statusBar.backgroundColor = alpha == 1 ? .clear : colorBar?.withAlphaComponent(alpha)
        }
    }
    
    func configColorBar(colorBar: [UIColor], colorTitle: UIColor, colorBarButton: UIColor, alpha: CGFloat = 1, isTranslucent: Bool = false) {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let heightStatusNavBar = statusBarHeight  + (self.navigationController?.navigationBar.frame.height ?? 0.0)
        
        self.navigationBar.setBackgroundImage(alpha == 1 ? nil : UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = alpha == 1 ? nil : UIImage()
        self.navigationBar.tintColor = colorBarButton
        self.navigationBar.isTranslucent = isTranslucent
        self.navigationBar.barTintColor = UIColor(gradientStyle: .topToBottom, withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: heightStatusNavBar), andColors: colorBar)?.withAlphaComponent(alpha)
        self.navigationBar.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: heightStatusNavBar), andColors: colorBar)?.withAlphaComponent(alpha)
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorTitle
        ]
        if #available(iOS 13.0, *) {
            if let navigation = self.view {
                UINavigationController.statusbarView = navigation.subviews.first { (view) -> Bool in
                    return view.tag == 20192020
                }
                if UINavigationController.statusbarView == nil {
                    UINavigationController.statusbarView = UIView()
                    UINavigationController.statusbarView?.tag = 20192020
                    navigation.addSubview(UINavigationController.statusbarView!)
                    UINavigationController.statusbarView?.translatesAutoresizingMaskIntoConstraints = false
                    UINavigationController.statusbarView?.heightAnchor
                        .constraint(equalToConstant: statusBarHeight).isActive = true
                    UINavigationController.statusbarView?.widthAnchor
                        .constraint(equalTo: navigation.widthAnchor, multiplier: 1.0).isActive = true
                    UINavigationController.statusbarView?.topAnchor
                        .constraint(equalTo: navigation.topAnchor).isActive = true
                    UINavigationController.statusbarView?.centerXAnchor
                        .constraint(equalTo: navigation.centerXAnchor).isActive = true
                }
                UINavigationController.statusbarView?.backgroundColor = alpha == 1 ? UIColor.clear : UIColor(gradientStyle: .topToBottom, withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: heightStatusNavBar), andColors: colorBar)?.withAlphaComponent(alpha)
            }
        } else {
            let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
            statusBar.backgroundColor = alpha == 1 ? UIColor.clear : UIColor(gradientStyle: .topToBottom, withFrame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: heightStatusNavBar), andColors: colorBar)?.withAlphaComponent(alpha)
        }
    }
}
