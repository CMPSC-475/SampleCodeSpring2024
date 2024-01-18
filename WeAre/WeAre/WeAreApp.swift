//
//  WeAreApp.swift
//  WeAre
//
//  Created by Nader Alfares on 1/11/24.
//

import SwiftUI

@main
struct WeAreApp: App {
    // THE VIEW MODEL
    @StateObject var cheerManager : CheerManager = CheerManager()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(cheerManager)
                
            
        }
    }
}
