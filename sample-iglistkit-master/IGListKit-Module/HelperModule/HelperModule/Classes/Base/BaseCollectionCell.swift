//
//  BaseCollectionCell.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 28/01/20.
//

import UIKit
import IGListKit

open class BaseCollectionCell: UICollectionViewCell {
    // MARK: Properties
    /// IndexPath of Collection Cell
    public var index: Int!
    /// Setup constraint
    public var shouldSetupConstraints = true
    /// A name of a view
    private static var NAME: String {
        let type = String(describing: self)
        return type
    }
    
    // MARK: Function
    /** Register a cell collection to ui collection view
     */
    public static func registerCell(with collectionView: UICollectionView, bundle: Bundle?) {
        collectionView.register(UINib(nibName: NAME, bundle: bundle), forCellWithReuseIdentifier: NAME)
    }
    
    /** Initialization a cell collection
    */
    public static func initCell(_ collectionContext: ListCollectionContext?, section: ListSectionController, index: Int) -> UICollectionViewCell {
        guard let collectionContext = collectionContext, let cell = collectionContext.dequeueReusableCell(of: self, withReuseIdentifier: NAME, for: section, at: index) as? BaseCollectionCell else { return UICollectionViewCell() }
        cell.index = index
        return cell
    }
}
