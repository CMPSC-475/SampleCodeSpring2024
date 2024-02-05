//
//  CheckersApp.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import SwiftUI

@main
struct CheckersApp: App {
    @StateObject var manager  = GameManager()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(manager)
        }
    }
}
