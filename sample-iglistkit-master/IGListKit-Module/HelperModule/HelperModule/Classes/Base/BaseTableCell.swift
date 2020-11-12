//
//  BaseTableCell.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 26/09/19.
//

import UIKit

open class BaseTableCell: UITableViewCell {
    // MARK: Properties
    /// Setup constraint
    public var shouldSetupConstraints = true
    /// A name of a view
    private static var NAME: String {
        let type = String(describing: self)
        return type
    }
    
    // MARK: Function
    /// Register a cell
    public static func registerCell(with tableVw: UITableView, bundle: Bundle?) {
        tableVw.register(UINib(nibName: NAME, bundle: bundle), forCellReuseIdentifier: NAME)
    }
    
    /// init a cell
    public static func initCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, data: Any?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NAME, for: indexPath) as? BaseTableCell else { return UITableViewCell() }
        cell.configureView(data: data)
        cell.selectionStyle = .none
        return cell
    }
    
    open func configureView(data: Any?) {}
}
