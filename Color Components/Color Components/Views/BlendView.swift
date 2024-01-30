//
//  BlendView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/29/24.
//

import SwiftUI

struct BlendView: View {
    var components : [ColorComponent]

    var count : Int {components.count}
    let size : CGFloat = 150
    let radius : CGFloat = 50
    let opacity = 0.3
    
    var body: some View {
        ZStack {
            ForEach(0..<count, id:\.self) {i in
                let angle = CGFloat(i)*(2*CGFloat.pi)/CGFloat(count)
                Circle()
                    .fill(colorForComponent(components[i]))
                    .opacity(opacity)
                    .frame(width:size)
                    .offset(x: radius * cos(angle), y: radius * sin(angle))
            }
        }
    }
    
    func colorForComponent(_ component:ColorComponent) -> Color {
        let color = Color(red: component.red, green: component.green, blue: component.blue)
        return color
    }
}

#Preview {
    BlendView(components: [ColorComponent(),ColorComponent(),ColorComponent(),])
}
