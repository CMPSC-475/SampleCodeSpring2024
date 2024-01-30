//
//  Color_ComponentsApp.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI

@main
struct Color_ComponentsApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var colorManager = ColorManager()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(colorManager)
                .onChange(of: scenePhase) { oldValue, newValue in
                    switch newValue {
                    case .background:
                        colorManager.save()
                    default:
                        break
                    }
                }
        }
    }
}
