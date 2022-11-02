//
//  DonationPackage.swift
//  HallOfFame
//
//  Created by Rene Bults on 01/11/2022.
//

import Foundation
import StoreKit
import SwiftUI

struct Package: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var price: Double
}


let offerList = [Package(title: "small", description: "small package", price: 0.99),
                 Package(title: "medium", description: "medium package", price: 4.99),
                 Package(title: "large", description: "large package", price: 9.99)]
