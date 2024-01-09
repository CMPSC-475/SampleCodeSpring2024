//
//  CaptionedImage.swift
//  UIExamples
//
//  Created by Nader Alfares on 1/9/24.
//

import SwiftUI

struct CaptionedImage: View {
    var body: some View {
                ZStack(alignment:.bottomTrailing) {
                    Image("Pizza 1")
                        .resizable()
                    .aspectRatio(contentMode: .fit)
                    Text("Pizza sul Lago")
                        .foregroundColor(.white)
                        .padding()
                }
                .padding()
    }
}

struct CaptionedImage_Previews: PreviewProvider {
    static var previews: some View {
        CaptionedImage()
    }
}
