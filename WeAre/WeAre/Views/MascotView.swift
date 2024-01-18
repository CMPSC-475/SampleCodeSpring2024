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
            .border(Color.yellow, width: 10)
            .aspectRatio(contentMode: .fit)
            .frame(height: 350)


    }
}

#Preview {
    MascotView(imageName: "Mascot 0")
}
