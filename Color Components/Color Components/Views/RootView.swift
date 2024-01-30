//
//  ContentView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI

enum Showing : String, Identifiable, CaseIterable {
    case  preferences, blend
    var id: RawValue { rawValue}
}

struct RootView: View {
    @EnvironmentObject var manager : ColorManager
//    @State private var showPrefrences = false
    @State private var showing : Showing?
    var body: some View {
        VStack {
            
            ForEach($manager.components) {$component in
                ColorShapeView(component: $component)
            }
            Spacer()
            ControlView(showing: $showing)
        }
        .sheet(item: $showing, onDismiss: nil) {item in
            
            switch item  {
            case .preferences:
                PreferenceView(preferences: $manager.preferences)
            case .blend:
                BlendView(components: manager.components)
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(ColorManager())
}
