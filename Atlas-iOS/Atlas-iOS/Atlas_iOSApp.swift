//
//  Atlas_iOSApp.swift
//  Atlas-iOS
//
//  Created by Nader Alfares on 4/3/24.
//

import SwiftUI

@main
struct Atlas_iOSApp: App {
    @State var atlasManager = AtlasManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(atlasManager)
        }
    }
}
