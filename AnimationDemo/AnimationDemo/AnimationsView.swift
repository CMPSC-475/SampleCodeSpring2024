//
//  ContentView.swift
//  AnimationDemo
//
//  Created by Nader Alfares on 2/6/24.
//

import SwiftUI

struct AnimationsView: View {
    @State var upScale : Bool = false
    @State var scale : CGFloat = 1.0
    @State var opacity : CGFloat = 1.0
    @State var square  = false
    @State var ratio : CGFloat = 1.0
    @State var depth : CGFloat = 0
    @State var angle :CGFloat = 45
    
    var body: some View {
        // ScrollView(.vertical) {
        VStack(spacing:20) {
            
            Circle()
                .fill(upScale ? .red : .blue)
                .opacity(upScale ? 0.01 : 1.0)
                .frame(width:100)
                .scaleEffect(upScale ? 2.0 : 1.0)
            // .scaleEffect(scale)
                .animation(.default.repeatForever(autoreverses: true), value: upScale)
                .onAppear { upScale.toggle()}
                .onTapGesture {
                    upScale.toggle()
                }
            
            Rectangle()
                .fill(square ? .red : .green)
                .frame(width:100,height:100)
                .cornerRadius(square ? 0 : 50)
                .animation(.linear(duration: 1.0).repeatForever(autoreverses: true), value: square)
                .onAppear {
                    square.toggle()
                }
            
            Diamond()
                .fill(.orange)
                .aspectRatio(ratio, contentMode: .fit)
                .animation(.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 1).repeatForever(autoreverses: true), value: ratio)
                .onAppear {
                    ratio = (ratio == 1.0) ? 3.0 : 1.0
                }
            
            Arc(offset: depth)
                .stroke(style: .init(lineWidth: 10.0, lineCap: .round, lineJoin: .round, miterLimit: 1.0, dash: [], dashPhase: 0))
                .animation(.linear(duration: 2.0).repeatForever(autoreverses: true), value: depth)
                .onAppear {
                    depth = (depth==0) ? -90 : 0
                    
                }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.purple)
                .aspectRatio(0.20, contentMode: .fit)
                .rotationEffect(Angle(degrees: angle), anchor: UnitPoint(x: 0.5, y: 1))
                .frame(height: 100)
                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: angle)
                .onAppear {
                    angle = -45
                }
            
        }
        .padding()
        //  }
    }
}

#Preview {
    AnimationsView()
}
