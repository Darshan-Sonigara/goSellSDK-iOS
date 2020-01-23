//
//  ApplePayTableViewCell.swift
//  goSellSDK
//
//  Created by Osama Rabie on 07/01/2020.
//  Copyright © 2020 Tap Payments. All rights reserved.
//

import UIKit

import struct CoreGraphics.CGBase.CGFloat
import class UIKit.NSLayoutConstraint.NSLayoutConstraint
import class UIKit.UIImageView.UIImageView
import class UIKit.UILabel.UILabel
import class UIKit.UIScreen.UIScreen
import class UIKit.UITableViewCell.UITableViewCell
import class UIKit.UIView.UIView
import class PassKit.PKPaymentButton
import class PassKit.PKPaymentAuthorizationViewController
import enum PassKit.PKPaymentButtonType

internal class ApplePayTableViewCell: BaseTableViewCell {
    
    // MARK: - Internal -
    // MARK: Properties
    
    internal weak var model: ApplePaymentOptionTableViewCellModel?
    
    // MARK: - Private -
    // MARK: Properties
    
    //@IBOutlet private weak var titleLabel:      UILabel?
    @IBOutlet private weak var iconImageView:   UIImageView?
    //@IBOutlet private weak var arrowImageView:  UIImageView?
}

// MARK: - LoadingWithModelCell
extension ApplePayTableViewCell: LoadingWithModelCell {
    
    internal func updateContent(animated: Bool) {
        
        //self.titleLabel?.text       = self.model?.title
        //self.titleLabel?.setTextStyle(Theme.current.paymentOptionsCellStyle.web.titleStyle)
        
        self.iconImageView?.image   = self.model?.iconImage
        
        let applPayButtonType:PKPaymentButtonType = model?.applePayButtonType() ?? .buy
        
        let applePayButton:PKPaymentButton = PKPaymentButton(paymentButtonType: applPayButtonType, paymentButtonStyle: .black)
        //applePayButton.backgroundColor = .blue
        var frame:CGRect = applePayButton.frame
        frame.size.width = self.frame.width - 30
        frame.size.height = 40
        applePayButton.frame = frame
        
        applePayButton.center = contentView.center
        applePayButton.addTarget(self, action: #selector(applePayButtonClicked(_:)), for: .touchUpInside)
        contentView.addSubview(applePayButton)
        
       // self.arrowImageView?.image  = self.model?.arrowImage
        self.backgroundColor = UIColor.clear
    }
    
    @objc private func applePayButtonClicked(_ sender: Any) {
        
        //guard let model = Process.shared.viewModelsHandlerInterface.paymentOptionViewModel(at: model!.indexPath) as? TableViewCellViewModel else { return }
        
        //model.tableViewDidSelectCell(model.)
        model?.tableViewDidSelectCell(model!.tableView!)
    }
}
