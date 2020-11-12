//
//  IGListKitSectionController.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit
import IGListKit

class IGListKitSectionController: ListSectionController {
    /// List Items
    public var items: [String] = []
    /// A Closure for refresh data section
    public var onRefreshDataSection: (()->())?
    /// A Closure for selected data
    public var onSelectedItem: ((_ idx: Int)->())?
    
    // MARK: Function
    /** Initialization
     */
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.minimumInteritemSpacing = 16
        self.minimumLineSpacing = 16
        self.onRefreshDataSection = {
            self.collectionContext?.performBatch(animated: true, updates: { batchContext in
              batchContext.reload(self)
            }, completion: nil)
        }
    }
    
    /** Number of items in one section
     */
    override func numberOfItems() -> Int {
        return self.items.count
    }
    
    /** Set the cell here
    */
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = IGListKitGridCell.initCell(self.collectionContext, section: self, index: index) as! IGListKitGridCell
        cell.item = self.items[index]
        cell.setButtonHandler { (view) in
            self.onSelectedItem?(index)
        }
        return cell
    }
    
    /** Size of the item
    */
    override func sizeForItem(at index: Int) -> CGSize {
        return IGListKitGridCell.cellSize(screenWidth: self.collectionContext?.containerSize.width ?? 0)
    }
}
