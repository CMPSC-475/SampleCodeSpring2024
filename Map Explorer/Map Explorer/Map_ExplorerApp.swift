//
//  Map_ExplorerApp.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI

@main
struct Map_ExplorerApp: App {
    @StateObject var manager = Manager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
        }
    }
}
