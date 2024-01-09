//
//  ConcentricRings.swift
//  UIExamples
//
//  Created by Nader Alfares on 1/9/24.
//

import SwiftUI

struct ConcentricRings: View {
    let colors : [Color]
    var body: some View {
        ZStack {
            ForEach(0..<10) {i in
                Circle()
                    .fill(colors[i%colors.count])
                    .scaleEffect(1.0-(Double(i)*0.05))
            }
        }
    }
}

struct ConcentricRings_Previews: PreviewProvider {
    static var previews: some View {
        ConcentricRings(colors:[.red,.blue,.orange])
    }
}
