//
//  HelperVC.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 26/10/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit
import SwiftMessages

public class HelperVC {
    public static func changeRootViewController(vc: UIViewController) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        let trans = CATransition()
        trans.type = CATransitionType.push
        trans.subtype = CATransitionSubtype.fromTop
        window.layer.add(trans, forKey: kCATransition)
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    public static func loadNetworkActivityIndicator(visible: Bool){
        UIApplication.shared.isNetworkActivityIndicatorVisible = visible
    }
    
    @available(iOS 13.0, *)
    public static func showMessage(interfaceStyle: UIUserInterfaceStyle, icon: String? = nil, title: String? = nil, body: String? = nil, backgroundColor: UIColor? = nil, textColor: UIColor? = nil, state: Bool? = nil, layout: MessageView.Layout = .messageView, style: SwiftMessages.PresentationStyle = .top) {
        let messageView = MessageView.viewFromNib(layout: layout)
        messageView.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "", buttonTapHandler: { _ in SwiftMessages.hide() })
        let image = UIImage.loadLocalImage(bundle: HelperBundle.bundle, moduleName: HelperBundle.moduleName, name: icon ?? "", ext: "png")
        messageView.configureTheme(backgroundColor: backgroundColor ?? (interfaceStyle == .light ? .darkGray : .white), foregroundColor: textColor ?? (interfaceStyle == .light ? .white : .darkGray), iconImage: image, iconText: "")
        // Component
        messageView.button?.isHidden = true
        messageView.titleLabel?.isHidden = title?.isEmpty ?? false
        // Config
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        config.duration = .seconds(seconds: 5)
        config.preferredStatusBarStyle = .lightContent
        config.presentationStyle = style
        // Show and Hide
        if state == true {
            SwiftMessages.show(config: config, view: messageView)
        } else {
            SwiftMessages.hide()
        }
    }
    
    public static func showMessage(icon: String? = nil, title: String? = nil, body: String? = nil, backgroundColor: UIColor? = nil, textColor: UIColor? = nil, state: Bool? = nil, layout: MessageView.Layout = .messageView, style: SwiftMessages.PresentationStyle = .top) {
        let messageView = MessageView.viewFromNib(layout: layout)
        messageView.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "", buttonTapHandler: { _ in SwiftMessages.hide() })
        let image = UIImage.loadLocalImage(bundle: HelperBundle.bundle, moduleName: HelperBundle.moduleName, name: icon ?? "", ext: "png")
        messageView.configureTheme(backgroundColor: backgroundColor ?? .darkGray, foregroundColor: textColor ?? .white, iconImage: image, iconText: "")
        // Component
        messageView.button?.isHidden = true
        messageView.titleLabel?.isHidden = title?.isEmpty ?? false
        // Config
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        config.duration = .seconds(seconds: 5)
        config.preferredStatusBarStyle = .lightContent
        config.presentationStyle = style
        // Show and Hide
        if state == true {
            SwiftMessages.show(config: config, view: messageView)
        } else {
            SwiftMessages.hide()
        }
    }
}
