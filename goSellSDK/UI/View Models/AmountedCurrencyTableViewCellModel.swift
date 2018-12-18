//
//  AmountedCurrencyTableViewCellModel.swift
//  goSellSDK
//
//  Copyright © 2018 Tap Payments. All rights reserved.
//

import class UIKit.UIImage.UIImage
import class UIKit.UITableView.UITableView

internal class AmountedCurrencyTableViewCellModel: TableViewCellViewModel {
    
    // MARK: - Internal -
    // MARK: Properties
    
    internal weak var cell: AmountedCurrencyTableViewCell?
    
    internal let amountedCurrency: AmountedCurrency
	
    internal private(set) lazy var currencyNameText: String = .empty
    
    internal private(set) lazy var amountText: String = .empty
	
    internal var isSelected = false {
        
        didSet {
            
            self.updateCell(animated: true)
        }
    }
    
    // MARK: - Internal -
    // MARK: Methods
    
    internal init(indexPath: IndexPath, amountedCurrency: AmountedCurrency) {
        
        self.amountedCurrency = amountedCurrency
		
        super.init(indexPath: indexPath)
		
		self.updateLocalization()
    }
	
	internal func updateLocalization() {
		
		self.currencyNameText	= self.amountedCurrency.readableCurrencyName
		self.amountText 		= self.amountedCurrency.displayValue
		
		self.updateCell(animated: false)
	}
	
	internal func updateTheme() {
		
		self.updateCell(animated: false)
	}
}

// MARK: - Filterable
extension AmountedCurrencyTableViewCellModel: Filterable {
    
    internal func matchesFilter(_ filterText: String) -> Bool {
        
        return self.currencyNameText.containsIgnoringCase(filterText) || self.amountedCurrency.currency.isoCode.containsIgnoringCase(filterText)
    }
}

// MARK: - SingleCellModel
extension AmountedCurrencyTableViewCellModel: SingleCellModel {}