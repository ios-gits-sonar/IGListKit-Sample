//
//  UIImage+Extension.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 18/09/20.
//  Copyright © 2020 Ajie Arganata. All rights reserved.
//

import UIKit

public extension UIImage {
    static func loadLocalImage(bundle: Bundle?, moduleName: String, name: String, ext: String)-> UIImage? {
        if name == "" { return nil }
        var bundleURL = bundle?.url(forResource: moduleName, withExtension: "bundle")
        if bundleURL == nil {
            print("Bundle Not Found, trying using Assets")
            bundleURL = bundle?.url(forResource: "Assets", withExtension: "bundle")
        }
        guard let url = bundleURL, let bundle = Bundle(url: url) else {
            print("Load Bundle Faild")
            return nil
        }
        guard let imageURL = bundle.url(forResource: name, withExtension: ext) else { return nil }
        let image = UIImage(contentsOfFile: imageURL.path)
        return image
    }
}
