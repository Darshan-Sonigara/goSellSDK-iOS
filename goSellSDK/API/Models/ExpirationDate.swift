//
//  ExpirationDate.swift
//  goSellSDK
//
//  Copyright © 2018 Tap Payments. All rights reserved.
//

/// Expiration Date structure.
internal struct ExpirationDate {
    
    // MARK: - Internal -
    // MARK: Properties
    
    /// Expiration month.
    internal var month: Int
    
    /// Expiration year.
    internal var year: Int {
        
        didSet {
            
            self.updateYearToReal()
        }
    }
    
    // MARK: Methods
    
    /// Initialized expiration date with month and year.
    internal init(month: Int, year: Int) {
        
        self.month = month
        self.year = year
        
        self.updateYearToReal()
    }
    
    // MARK: - Private -
    
    private enum CodingKeys: String, CodingKey {
        
        case month  = "month"
        case year   = "year"
    }
    
    // MARK: Methods
    
    private mutating func updateYearToReal() {
        
        let currentYear = Date().year
        
        if self.year < currentYear {
            
            self.year = self.year + 100 * Int(currentYear / 100)
        }
    }
}

// MARK: - Decodable
extension ExpirationDate: Decodable {
    
    internal init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let m = try container.decodeInt(forKey: .month)
        let y = try container.decodeInt(forKey: .year)
        
        self.init(month: m, year: y)
    }
}
