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

        VStack(spacing:0) {
            ForEach(0..<manager.boardSize, id:\.self) {r in
                HStack(spacing:0) {
                    ForEach(0..<manager.boardSize, id:\.self) {c in
                        let color = (r+c)%2==0 ? Color.gray : Color.black
                        Rectangle()
                            .fill(color)
                            .aspectRatio(1, contentMode: .fit)
                        
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
