//
//  ShowPopupViewModel.swift
//  HallOfFame
//
//  Created by Rene Bults on 19/10/2022.
//

import Foundation

class ShowSetting: ObservableObject {
    @Published var isShowing: Bool = false
    @Published var testCounter: Int = 0
    
    func setShowing() {
        isShowing = true
        testCounter += 1
    }
    
    func setHiding() {
        isShowing = false
    }
}


