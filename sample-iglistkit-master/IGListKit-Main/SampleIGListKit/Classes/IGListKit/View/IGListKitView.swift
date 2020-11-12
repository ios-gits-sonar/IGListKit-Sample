//
//  IGListKitView.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit
import HelperModule
import IGListKit

class IGListKitView: BaseCustomView {
    // MARK: Properties
    var collectionVw: UICollectionView!
    
    // MARK: Function
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configCollection()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func updateConstraints() {
        if shouldSetupConstraints {
            self.collectionVw.autoPinEdgesToSuperviewSafeArea(with: .zero)
            // Auto Layout Constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
}

extension IGListKitView {
    /** Configure View Collection
     */
    private func configCollection() {
        let collectionFlowLayout = ListCollectionViewLayout.init(stickyHeaders: false, scrollDirection: .vertical, topContentInset: 0, stretchToEdge: true)
        self.collectionVw = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        self.collectionVw.alwaysBounceVertical = true
        self.collectionVw.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        if #available(iOS 13.0, *) {
            self.collectionVw.backgroundColor = .systemBackground
            self.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions
            self.collectionVw.backgroundColor = .white
            self.backgroundColor = .white
        }
        self.addSubview(collectionVw)
    }
    
    public func setupHandlerBarButton(handler: ((UIBarButtonItem)->())?) {
        
    }
}
