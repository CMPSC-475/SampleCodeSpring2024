//
//  Color_ComponentsApp.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI

@main
struct Color_ComponentsApp: App {
    @StateObject var colorManager = ColorManager()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(colorManager)
        }
    }
}
