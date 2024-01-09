//
//  CornerSquares.swift
//  UIExamples
//
//  Created by Nader Alfares on 1/9/24.
//

import SwiftUI

struct CornerSquares: View {
    var body: some View {
        VStack {
            SquareRow()
            Spacer()
            SquareRow()
        }
    }
}

struct RedSquare: View {
    var body: some View {
        Rectangle().fill(.red)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct SquareRow: View {
    var body: some View {
        HStack{
            RedSquare()
            Spacer(minLength:100)
            RedSquare()
        }
    }
}

struct CornerSquares_Previews: PreviewProvider {
    static var previews: some View {
        CornerSquares()
    }
}
