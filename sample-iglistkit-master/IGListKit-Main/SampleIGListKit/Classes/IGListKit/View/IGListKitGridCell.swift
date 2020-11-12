//
//  IGListKitGridCell.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit
import HelperModule

class IGListKitGridCell: BaseCollectionCell {
    // MARK: Properties
    private var gridContentVw: CardView!
    private var gridImageCardVw: CardView!
    public var gridImageVw: UIImageView!
    public var gridBtn: CustomButton!
    /// Item
    public var item: String? {
        didSet {
            self.gridImageVw.setImageWith(url: item)
        }
    }
    
    // MARK: Function
    /** Initialization Frame, will setup the component to view
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configGridContent()
        self.configGridImage()
        self.updateConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /** Update Constraint
    */
    override func updateConstraints() {
        self.initConstraint()
        super.updateConstraints()
    }
    
    /** Content Cell Size
    */
    public static func cellSize(screenWidth: CGFloat) -> CGSize {
        let width = screenWidth
        let orientation = UIApplication.shared.statusBarOrientation
        let maxItem: CGFloat = orientation == .portrait ? 3 : 5
        let collectionLeftAndRight: CGFloat = 16*(maxItem+1)
        let totalSize = ((width - collectionLeftAndRight) / maxItem)
        let size = CGSize(width: totalSize, height: totalSize)
        return size
    }
}

extension IGListKitGridCell {
    /** Content View
    */
    private func configGridContent() {
        self.gridContentVw = CardView(frame: .zero, cornerRadius: 8)
        self.gridContentVw.backgroundColor = .white
        self.contentView.addSubview(self.gridContentVw)
        
        self.gridBtn = CustomButton(frame: .zero)
        self.gridBtn.applyStyle(title: "", font: nil, fontColor: .white, backgroundColor: .clear, shadow: 0, borderRadius: 8)
        self.contentView.addSubview(self.gridBtn)
    }

    /** Grid Image
    */
    private func configGridImage() {
        self.gridImageCardVw = CardView(frame: .zero, cornerRadius: 8)
        self.gridImageCardVw.clipsToBounds = true
        self.gridImageVw = UIImageView()
        self.gridImageVw.cornerRadiusPreset = .cornerRadius3
        self.gridImageVw.clipsToBounds = true
        self.gridImageVw.contentMode = .scaleAspectFill
        self.gridImageVw.backgroundColor = .lightGray
        self.gridImageCardVw.addSubview(self.gridImageVw)
        self.gridContentVw.addSubview(self.gridImageCardVw)
    }
    
    /** Initialization the constraint
     */
    private func initConstraint() {
        if shouldSetupConstraints {
            self.gridContentVw.autoPinEdgesToSuperviewEdges(with: .zero)
            self.gridBtn.autoPinEdgesToSuperviewEdges()
            self.gridImageCardVw.autoPinEdgesToSuperviewEdges(with: .zero)
            self.gridImageVw.autoPinEdgesToSuperviewEdges(with: .zero)
            // Auto Layout Constraints
            shouldSetupConstraints = false
        }
    }
    
    public func setButtonHandler(handler: ((UIView)->())?) {
        self.gridBtn.addHandlerButton(handler: handler)
    }
}
