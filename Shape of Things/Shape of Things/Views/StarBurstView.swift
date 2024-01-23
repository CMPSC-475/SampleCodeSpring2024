//
//  StarBurstView.swift
//  Shape of Things
//
//  Created by Nader Alfares on 1/23/24.
//

import SwiftUI

struct StarBurst: View {
    let count : Int
    let ration: CGFloat
    var body: some View {
        ZStack {
            ForEach(0..<count, id:\.self) { i in
                Diamond()
                    .fill(.red)
                    .aspectRatio(ration, contentMode: .fit)
                    .rotationEffect(Angle(radians: CGFloat.pi * CGFloat(i)/CGFloat(count)))
            }
        }
    }
}

struct StarBurstView: View {
    var body: some View {
        StarBurst(count: 10, ration: 2.0)
    }
}

#Preview {
    StarBurstView()
}
