//
//  ColorShapeView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI

struct ColorShapeView: View {
    @EnvironmentObject var manager : ColorManager
    @Binding var component: ColorComponent
    @State var showColorSheet : Bool = false
    
    var body: some View {
        Button {
            showColorSheet.toggle()
        } label: {
            switch manager.preferences.colorShape {
            case .circle:
                Circle()
                    .fill(manager.colorForComponent(component))
            case .rectangle:
                RoundedRectangle(cornerRadius: 10)
                    .fill(manager.colorForComponent(component))
            case .triangle:
                Triangle()
                    .fill(manager.colorForComponent(component))
            case .diamond:
                Diamond()
                    .fill(manager.colorForComponent(component))
            }
        }
        .sheet(isPresented: $showColorSheet) {
            Form {
                Slider(value: $component.red, in: 0...1) {
                    Text("Red")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("1")
                }
                
                Slider(value: $component.green, in: 0...1) {
                    Text("green")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("1")
                }
                
                Slider(value: $component.blue, in: 0...1) {
                    Text("Blue")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("1")
                }
            }

        }
        
        

    }
}


#Preview {
    ColorShapeView(component: .constant(ColorComponent.standard))
        .environmentObject(ColorManager())
}
