//
//  CustomUIBarButtonItem.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 26/05/20.
//  Copyright © 2019 Ajie Pramono Arganata. All rights reserved.
//

import UIKit

public class CustomUIBarButtonItem: UIBarButtonItem {
    private var handlerTouchUpInside: ((UIBarButtonItem)->())?

    public func setImageLocal(bundle: Bundle?, moduleName: String, name: String, ext: String, renderingOriginal: Bool = false) {
        let image = UIImage.loadLocalImage(bundle: bundle, moduleName: moduleName, name: name, ext: ext)
        if renderingOriginal {
            self.image = image?.withRenderingMode(.alwaysOriginal)
        } else {
            self.image = image
        }
    }

    public func addHandlerButton(handler: ((UIBarButtonItem)->())?) {
        handlerTouchUpInside = handler
        self.target = self
        self.action = #selector(touchUpInside)
    }
    
    @objc private func touchUpInside() {
        self.handlerTouchUpInside?(self)
    }
    
}
