//
//  BoardView.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var manager:GameManager
    var body: some View {
        let dimension = CGFloat(manager.blockSize)
        VStack(spacing:0) {
            ForEach(0..<manager.boardSize, id:\.self) {r in
                HStack(spacing:0) {
                    ForEach(0..<manager.boardSize, id:\.self) {c in
                        let color = (r+c)%2==0 ? Color.gray : Color.black
                        Rectangle()
                            .fill(color)
                            .frame(width: CGFloat(dimension), height: CGFloat(dimension))
                        
                    }
                }
            }
        }
    }
}
#Preview {
    BoardView()
        .environmentObject(GameManager())
}
