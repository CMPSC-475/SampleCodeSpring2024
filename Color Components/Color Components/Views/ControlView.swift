//
//  ControlView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI


struct ControlView: View {
    @EnvironmentObject var manager : ColorManager
    var body: some View {
        HStack {
            Spacer()
            Button(action: {manager.addColor()}) {
                Image(systemName: "plus.app")
            }
            Spacer()
            Button(action: {manager.deleteLast()}) {
                Image(systemName: "delete.left")
            }
            Spacer()
            Button(action: {manager.clearColors()}) {
                Image(systemName: "eraser")
            }
            Spacer()
            Button(action: {manager.invertColors()}) {
                Image(systemName: "arrow.triangle.swap")
            }
            Spacer()
        }
    }
}

#Preview {
    ControlView()
        .environmentObject(ColorManager())
}
