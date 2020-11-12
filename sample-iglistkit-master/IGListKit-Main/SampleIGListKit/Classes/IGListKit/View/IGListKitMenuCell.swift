//
//  IGListKitMenuCell.swift
//  SampleIGListKit
//
//  Created by Ajie Pramono Arganata on 05/11/20.
//  Copyright © 2020 GITS Indonesia. All rights reserved.
//

import UIKit
import HelperModule

class IGListKitMenuCell: BaseCollectionCell {
    // MARK: Properties
    private var menuContentVw: CardView!
    private var menuLbl: UILabel!
    private var menuBtn: CustomButton!
    /// Item
    public var item: String? {
        didSet {
            self.menuLbl.text = item ?? "-"
        }
    }
    
    // MARK: Function
    /** Initialization Frame, will setup the component to view
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configMenuContent()
        self.configMenuLabel()
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
    public static func cellSize(screenWidth: CGFloat, item: String) -> CGSize {
        let width = screenWidth - 32
        let heightLabel = TextSize.size(item, font: UIFont.boldSystemFont(ofSize: 14), width: width-16, insets: .zero).height
        let size = CGSize(width: width, height: heightLabel + 16)
        return size
    }
}

extension IGListKitMenuCell {
    /** Content View
    */
    private func configMenuContent() {
        self.menuContentVw = CardView(frame: .zero, cornerRadius: 8)
        self.menuContentVw.backgroundColor = .white
        self.contentView.addSubview(self.menuContentVw)
        
        self.menuBtn = CustomButton(frame: .zero)
        self.menuBtn.applyStyle(title: "", font: nil, fontColor: .white, backgroundColor: .clear, shadow: 0, borderRadius: 8)
        self.contentView.addSubview(self.menuBtn)
    }

    /** Menu Lbl
    */
    private func configMenuLabel() {
        self.menuLbl = UILabel(frame: .zero)
        self.menuLbl.textColor = .black
        self.menuLbl.font = UIFont.boldSystemFont(ofSize: 14)
        self.menuLbl.numberOfLines = 0
        self.menuContentVw.addSubview(self.menuLbl)
    }
    
    /** Initialization the constraint
     */
    private func initConstraint() {
        if shouldSetupConstraints {
            self.menuContentVw.autoPinEdgesToSuperviewEdges(with: .zero)
            self.menuBtn.autoPinEdgesToSuperviewEdges()
            self.menuLbl.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
            // Auto Layout Constraints
            shouldSetupConstraints = false
        }
    }
    
    public func setButtonHandler(handler: ((UIView)->())?) {
        self.menuBtn.addHandlerButton(handler: handler)
    }
}
