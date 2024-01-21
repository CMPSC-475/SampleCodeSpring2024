//
//  ContentView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var manager : ColorManager
    var body: some View {
        VStack {
            ForEach(manager.components) {component in
                ColorShapeView(component: component)
            }
            Spacer()
            ControlView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(ColorManager())
}
