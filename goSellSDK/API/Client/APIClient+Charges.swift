//
//  APIClient+Charges.swift
//  goSellSDK
//
//  Copyright © 2018 Tap Payments. All rights reserved.
//

import struct   TapNetworkManager.TapBodyModel
import class    TapNetworkManager.TapNetworkRequestOperation
import enum     TapNetworkManager.TapURLModel

internal extension APIClient {
    
    // MARK: - Internal -
    // MARK: Methods
    
    /// Creates a charge with the given charge request, calling completion when request finishes.
    ///
    /// - Parameters:
    ///   - request: Create charge request model.
    ///   - completion: Completion that will be called when request finishes.
    ///   - charge: Created charge in case of success.
    ///   - error: Error in case of failure.
    internal func createCharge(with request: CreateChargeRequest, completion: @escaping Completion<Charge>) {
        
        guard let bodyDictionary = self.convertModelToDictionary(request, callingCompletionOnFailure: completion) else { return }
        
        let body = TapBodyModel(body: bodyDictionary)
        let operation = TapNetworkRequestOperation(path: self.chargesRoute.rawValue, method: .POST, headers: self.staticHTTPHeaders, urlModel: nil, bodyModel: body, responseType: .json)
        
        self.performRequest(operation, using: self.chargesRoute.decoder, completion: completion)
    }
    
    // MARK: - Private -
    // MARK: Properties
    
    private var chargesRoute: Route {
        
        return .charges
    }
}