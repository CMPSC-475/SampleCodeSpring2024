//
//  DetailBird.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct DetailBird: View {
    let birdName: String
    var body : some View {
        HStack {
            Image(birdName)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width:100, height:100)
                .clipShape(Circle()) //RoundedRectangle(cornerRadius: 10))
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
            Spacer()
            Text(birdName)
                .italic()
                .minimumScaleFactor(0.5)
        }
        .padding()
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray).opacity(0.4))
    }
}

#Preview {
    DetailBird(birdName: "Ruffed Grouse")
}
