//
//  IGListKitDataSource.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit
import IGListKit

/// IGListKit Data Source is a class for collection data source
class IGListKitDataSource: NSObject, ListAdapterDataSource {
    /// The Section Grid  List
    private var sectionList = IGListKitSectionController()
    /// The Section Menu List
    private var sectionMenuList = IGListKitSectionMenuController()
    
    func sectionSelectedItem(onSelectedItem: ((_ idx: Int)->())?) {
        self.sectionList.onSelectedItem = onSelectedItem
    }
    
    func addListItem(items: [String]) {
        self.sectionList.items = items
        self.sectionMenuList.items =  items
        self.refreshSection()
    }
    
    func refreshSection() {
        self.sectionList.onRefreshDataSection?()
        self.sectionMenuList.onRefreshDataSection?()
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return ["grid", "menu"] as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object as? String == "grid" {
            return sectionList
        } else {
            return sectionMenuList
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
