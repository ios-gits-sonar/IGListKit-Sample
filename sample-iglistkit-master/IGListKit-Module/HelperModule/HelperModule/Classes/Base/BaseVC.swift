//
//  BaseVC.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 28/08/19.
//  Copyright © 2019 GITS Indonesia. All rights reserved.
//

import UIKit
import Material

open class BaseVC: UIViewController {
    private var refreshUIControl: UIRefreshControl?
    public var stillHasFocused = false
    
    deinit {
        print("DEINIT \(self)")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(becomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc open func becomeActive() {}
    
    @objc open func rotated() {}
    
    open func configureData(data: [String: Any?]){}
    
    open func configureView(){}
    
    open func checkInputValidator(showError: Bool = false, to textField: ErrorTextField? = nil)-> Bool {
        return true
    }
}

extension BaseVC {
    open func initRefresh(on view: UIScrollView) {
        self.refreshUIControl = UIRefreshControl()
        self.refreshUIControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        view.refreshControl = refreshUIControl
    }
    
    open func removeRefresh(from view: UIScrollView) {
        self.refreshUIControl?.endRefreshing()
        self.refreshUIControl?.removeTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        view.refreshControl = nil
        self.refreshUIControl = nil
    }
    
    open func stopRefresh() {
        self.refreshUIControl?.endRefreshing()
    }
    
    @objc open func refresh() {}
}
