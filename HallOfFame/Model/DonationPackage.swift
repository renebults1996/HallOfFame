//
//  DonationPackage.swift
//  HallOfFame
//
//  Created by Rene Bults on 01/11/2022.
//

import Foundation
import StoreKit

struct Package: Hashable {
    let id: String
    let title: String
    let description: String
    let locale: Locale
    var isLocked: Bool
    var price: String?
    
    lazy var formatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.locale = locale
        return nf
    }()
    
    init(product: SKProduct, isLocked: Bool = true) {
        self.id = product.productIdentifier
        self.title = product.localizedTitle
        self.description = product.localizedDescription
        self.isLocked = isLocked
        self.locale = product.priceLocale
        
        if isLocked {
            self.price = formatter.string(from: product.price)
        }
    }
    
}
