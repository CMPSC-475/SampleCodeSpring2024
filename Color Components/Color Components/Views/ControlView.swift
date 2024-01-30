//
//  ControlView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI


struct ControlView: View {
    @Binding var showing : Showing?  // for triggering Root's sheet modifier

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
            
            Group {  // HStack can have at most 10 views so we use Group here
                Spacer()
                Button(action: {manager.invertColors()}) {
                    Image(systemName: "arrow.triangle.swap")
                }
                Spacer()
                Button(action:{showing = .blend}) {
                    Image(systemName: "circle.hexagongrid.circle")
                }
                Spacer()
                Button(action: {showing = .preferences}) {
                    Image(systemName: "gear")
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    ControlView(showing: .constant(.blend))
        .environmentObject(ColorManager())
}
