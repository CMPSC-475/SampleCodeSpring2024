//
//  ColorShapeView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI

struct ColorShapeView: View {
    @EnvironmentObject var manager : ColorManager
    let component: ColorComponent
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(manager.colorForComponent(component))
    }
}


#Preview {
    ColorShapeView(component: ColorComponent.standard)
        .environmentObject(ColorManager())
}
