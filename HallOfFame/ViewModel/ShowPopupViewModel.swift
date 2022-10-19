//
//  ShowPopupViewModel.swift
//  HallOfFame
//
//  Created by Rene Bults on 19/10/2022.
//

import Foundation

class PopupViewModel: ObservableObject {
    
    @Published var isPressed: String = "false"
    
    func isButtonPressed() {
        isPressed = "true"
        print("i am pressed")
    }
}
