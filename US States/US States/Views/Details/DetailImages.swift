//
//  DetailImages.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct DetailImages: View {
    var imageNames : [String]
    var body : some View {
        VStack(spacing:10) {
            ForEach(imageNames, id:\.self) { imageName in
                Image(imageName)
                    .resizable()
                    .aspectRatio(nil, contentMode: .fill)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

#Preview {
    DetailImages(imageNames: [])
}
