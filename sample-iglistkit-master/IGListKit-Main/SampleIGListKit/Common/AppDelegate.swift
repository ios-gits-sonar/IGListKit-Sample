//
//  AppDelegate.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.rootViewController = SampleIGListKitWireframe.initSampleIGListKit()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

