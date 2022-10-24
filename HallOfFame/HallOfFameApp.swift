//
//  HallOfFameApp.swift
//  HallOfFame
//
//  Created by Rene Bults on 12/10/2022.
//

import SwiftUI

@main
struct HallOfFameApp: App {
    @StateObject var sheetManager = SheetManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sheetManager)
        }
    }
}
