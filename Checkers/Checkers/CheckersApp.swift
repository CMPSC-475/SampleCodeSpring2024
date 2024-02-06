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
            GeometryReader { proxy in
                GameView()
                    .environmentObject(manager)
                    .onAppear {
                        manager.setBoardWidth(Int(min(proxy.size.width, proxy.size.height)))
                    }
            }
        }
    }
}
