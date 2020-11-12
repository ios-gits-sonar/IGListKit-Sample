//
//  HelperBundle.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 22/10/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import Foundation

public struct HelperBundle {
    public static var moduleName = "HelperModule"
    
    public static var bundle: Bundle? {
        let podBundle = Bundle(for: BaseVC.self)
        return podBundle
    }
}
