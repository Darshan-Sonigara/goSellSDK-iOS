//
//  TableViewCellViewModel.swift
//  goSellSDK
//
//  Copyright © 2018 Tap Payments. All rights reserved.
//

import class UIKit.UITableView.UITableView

internal class TableViewCellViewModel: CellViewModel {
    
    // MARK: - Internal -
    // MARK: Properties
    
    internal weak var tableView: UITableView?
    
    internal var indexPathOfCellToSelect: IndexPath? {
        
        return nil
    }
    
    // MARK: Methods
    
    internal func tableViewDidSelectCell(_ sender: UITableView) { }
    
    internal func tableViewDidDeselectCell(_ sender: UITableView) { }
    
    internal func manuallySelectCellAndCallTableViewDelegate() {
        
        self.tableView?.selectRow(at: self.indexPath, animated: true, scrollPosition: .none, callDelegate: true)
    }
}