//
//  HallOfFameApp.swift
//  HallOfFame
//
//  Created by Rene Bults on 12/10/2022.
//

import SwiftUI

@main
struct HallOfFameApp: App {

    let productIDs = [
        //Use your product IDs instead
        "com.BLCKBIRDS.TreasureStore.IAP.PowerSword",
        "com.BLCKBIRDS.TreasureStore.IAP.HealingPotion",
        "com.BLCKBIRDS.TreasureStore.IAP.PirateSkin"
    ]
    
    @StateObject var storeManager = StoreManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(storeManager: storeManager)
                .onAppear(perform: {
                    storeManager.getProducts(productIDs: productIDs)
                        })
        }
    }
}
