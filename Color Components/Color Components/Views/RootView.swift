//
//  ContentView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var manager : ColorManager
    @State private var showPrefrences = false
    var body: some View {
        VStack {
            
            ForEach($manager.components) {$component in
                ColorShapeView(component: $component)
            }
            Spacer()
            ControlView(showPrefrences: $showPrefrences)
        }
        .sheet(isPresented: $showPrefrences, content: {
            PreferenceView(prefrences: $manager.preferences)
        })
    }
}

struct PreferenceView : View {
    @Binding var prefrences : Preferences
    var body : some View {
        Form {
            Picker("Choose a shape", selection: $prefrences) {
                ForEach(Preferences.allCases) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(ColorManager())
}
