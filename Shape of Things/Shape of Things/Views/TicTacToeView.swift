//
//  TicTacToeView.swift
//  Shape of Things
//
//  Created by Nader Alfares on 1/23/24.
//

import SwiftUI


struct TicTacToe : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.size.width
        let h = rect.size.height
        
        let factor : CGFloat = 1.0/3.0
        
        path.move(to: CGPoint(x: w*factor, y: 0))
        path.addLine(to: CGPoint(x: w*factor, y: h))
        path.move(to: CGPoint(x: w*factor*2, y: 0))
        path.addLine(to: CGPoint(x: w*factor*2, y: h))
        
        path.move(to: CGPoint(x: 0, y: h*factor))
        path.addLine(to: CGPoint(x: w, y: h*factor))
        path.move(to: CGPoint(x: 0, y: h*factor*2))
        path.addLine(to: CGPoint(x: w, y: h*factor*2))
        
        return path
    }
    
    
}

struct TicTacToeView: View {
    var body: some View {
        
        ZStack {
            TicTacToe()
                .stroke(lineWidth: 5)
                .aspectRatio(1, contentMode: .fit)
                .padding()

        }

    }
}

#Preview {
    TicTacToeView()
}
