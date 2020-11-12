//
//  ViewController.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit
import HelperModule
import IGListKit

/// This is a controller class of IGListKit
class IGListKitVC: BaseVC {
    // MARK: Properties
    /// IGListKit View
    private var igListKitView: IGListKitView!
    /// IGListKit View Model
    private lazy var viewModel = IGListKitVM()
    /// IGListKit Data Source
    private lazy var dataSource = IGListKitDataSource()
    /// IGListKit Adapter
    private lazy var adapter: ListAdapter = {
        return ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self,
            workingRangeSize: 0)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureView()
    }
    
    /** Configure Something here
     */
    override func configureView() {
        self.title = "Sample IGListKit"
        self.igListKitView = IGListKitView(frame: .zero)
        self.igListKitView.instantiateView(from: self.view)
        self.igListKitView.setupHandlerBarButton { (barBtn) in
            
        }
    
        self.adapter.collectionView = self.igListKitView.collectionVw
        self.adapter.dataSource = self.dataSource
        
        self.dataSource.sectionSelectedItem(onSelectedItem: { (idx) in
            
        })
        self.observableLiveData()
        self.viewModel.loadData()
    }
    
    override func becomeActive() {
        
    }
    
    override func rotated() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.dataSource.refreshSection()
            self.adapter.performUpdates(animated: true, completion: nil)
        }
    }
    /** Observabe function
     */
    func observableLiveData() {
        viewModel.loadListItem.observe = { items in
            self.dataSource.addListItem(items: items)
        }
        // Load Is Still Loading
        viewModel.loadApi.observe = { isLoad in
            HelperVC.loadNetworkActivityIndicator(visible: false)
        }
        // Load Error Message
        viewModel.loadError.observe = { message in
            if #available(iOS 13.0, *) {
                HelperVC.showMessage(interfaceStyle: self.overrideUserInterfaceStyle, body: message, state: true, style: .bottom)
            } else {// Fallback on earlier versions
                HelperVC.showMessage(body: message, state: true, style: .bottom)
            }
        }
    }
}

