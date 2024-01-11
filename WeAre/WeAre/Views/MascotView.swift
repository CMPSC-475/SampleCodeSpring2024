//
//  MascotView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/11/24.
//

import SwiftUI

struct MascotView: View {
    let imageName : String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .border(Color.yellow, width: 10)
    }
}

#Preview {
    MascotView(imageName: "Mascot 0")
}
