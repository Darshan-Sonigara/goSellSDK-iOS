//
//  CardsContainerTableViewCellModel.swift
//  goSellSDK
//
//  Copyright © 2018 Tap Payments. All rights reserved.
//

internal class CardsContainerTableViewCellModel: TableViewCellViewModel {
    
    // MARK: - Internal -
    // MARK: Properties
    
    internal weak var cell: CardsContainerTableViewCell?
    
    internal private(set) var collectionViewCellModels: [CardCollectionViewCellModel] = [] {
        
        didSet {
            
            self.updateCell(animated: true)
        }
    }
    
    internal private(set) lazy var cardsCollectionViewHandler: CardsContainerTableViewCellModelCollectionViewHandler = CardsContainerTableViewCellModelCollectionViewHandler(model: self)
    
    // MARK: Methods
    
    internal init(indexPath: IndexPath, cards: [SavedCard], currency: Currency) {
        
        self.cards = cards
        super.init(indexPath: indexPath)
        
        self.updateData()
    }
    
    internal func updateData() {
        
        self.collectionViewCellModels = self.generateCollectionViewCellModels(with: self.cards)
    }
    
    internal func deleteCardModel(_ model: CardCollectionViewCellModel) {
        
        PaymentDataManager.shared.updateUIByRemoving(model.card)
    }
    
    // MARK: - Private -
    // MARK: Properties
    
    private let cards: [SavedCard]
}

// MARK: - SingleCellModel
extension CardsContainerTableViewCellModel: SingleCellModel {}