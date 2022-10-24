//
//  SheetManager.swift
//  HallOfFame
//
//  Created by Rene Bults on 19/10/2022.
//

import Foundation


final class SheetManager: ObservableObject {
    
    enum Action {
        case na
        case present
        case dismiss
    }
    
    @Published private(set) var action: Action = .na
    
    func present() {
        guard !action.isPressed else {return}
        self.action = .present
    }
    
    func dismiss() {
        self.action = .dismiss
    }
}


extension SheetManager.Action {
    var isPressed: Bool {self == .present}
}
