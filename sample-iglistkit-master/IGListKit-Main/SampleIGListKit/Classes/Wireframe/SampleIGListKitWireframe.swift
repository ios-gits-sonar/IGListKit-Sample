//
//  SampleIGListKitWireframe.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit

public struct SampleIGListKitWireframe {
    
    public static func initSampleIGListKit()-> UIViewController {
        let vc = IGListKitVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overFullScreen
        nav.navigationBar.isTranslucent = true
        return nav
    }
}
