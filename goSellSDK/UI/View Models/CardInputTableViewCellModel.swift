//
//  CardInputTableViewCellModel.swift
//  goSellSDK
//
//  Copyright © 2018 Tap Payments. All rights reserved.
//

import struct TapCardValidator.DefinedCardBrand

internal class CardInputTableViewCellModel: CellViewModel {
    
    // MARK: - Internal -
    // MARK: Properties
    
    internal weak var cell: CardInputTableViewCell?
    
    internal var paymentOptions: [PaymentOption] = [] {
        
        didSet {
            
            self.updatePaymentOptions()
        }
    }
    
    internal var tableViewCellModels: [ImageTableViewCellModel]
    internal var displayedTableViewCellModels: [ImageTableViewCellModel] {
        
        didSet {
            
            guard self.displayedTableViewCellModels != oldValue else {
                
                return
            }
            
            self.updateCell(animated: true)
        }
    }
    
    internal lazy var tableViewHandler: CardInputTableViewCellModelTableViewHandler = CardInputTableViewCellModelTableViewHandler(model: self)
    
    internal lazy var cardDataValidators: [CardValidator] = []
    
    internal var definedCardBrand: DefinedCardBrand?
    
    internal override var indexPathOfCellToSelect: IndexPath? {
        
        return self.indexPath
    }
    
    // MARK: Methods
    
    internal required init(indexPath: IndexPath, paymentOptions: [PaymentOption]) {
        
        let iconURLs = paymentOptions.map { $0.imageURL }
        
        self.tableViewCellModels = type(of: self).generateTableViewCellModels(with: iconURLs)
        self.displayedTableViewCellModels = self.tableViewCellModels
        super.init(indexPath: indexPath)
        
        self.paymentOptions = paymentOptions
    }
    
    internal func connectionFinished() {
        
        self.cell?.bindContent()
    }
    
    // MARK: - Private -
    // MARK: Methods
    
    private func updatePaymentOptions() {
        
        let iconURLs = self.paymentOptions.map { $0.imageURL }
        self.tableViewCellModels = type(of: self).generateTableViewCellModels(with: iconURLs)
        self.updateDisplayedCollectionViewCellModels()
    }
}

// MARK: - SingleCellModel
extension CardInputTableViewCellModel: SingleCellModel {}