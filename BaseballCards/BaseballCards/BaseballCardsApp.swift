//
//  BaseballCardsApp.swift
//  BaseballCards
//
//  Created by Nader Alfares on 2/6/24.
//

import SwiftUI

@main
struct BaseballCardsApp: App {
    @StateObject var manager : Manager = Manager()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(manager)
        }
    }
}
