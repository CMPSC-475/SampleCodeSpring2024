//
//  OverlayImage.swift
//  UIExamples
//
//  Created by Nader Alfares on 1/9/24.
//

import SwiftUI

struct OverlayImage: View {
    var body: some View {
        Image("Pizza 1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(alignment: .bottomTrailing) {
                Text("Pizza sul Lago")
                    .foregroundColor(.white)
                    .padding()
                    
            }
            .padding()
    }
}

struct OverlayImage_Previews: PreviewProvider {
    static var previews: some View {
        OverlayImage()
    }
}
