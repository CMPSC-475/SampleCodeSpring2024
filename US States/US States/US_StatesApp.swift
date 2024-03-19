//
//  US_StatesApp.swift
//  US States
//
//  Created by Nader Alfares on 3/11/24.
//

import SwiftUI

@main
struct US_StatesApp: App {
    @State var manager = StatesManager()
    var body: some Scene {
        WindowGroup {
        HomeView()
                .environment(manager)
        }
    }
}
