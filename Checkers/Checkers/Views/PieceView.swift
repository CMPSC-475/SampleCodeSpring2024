//
//  PieceView.swift
//  Checkers
//
//  Created by Nader Alfares on 2/1/24.
//

import SwiftUI

struct PieceView: View {
    @EnvironmentObject var manager : GameManager
    let piece : Piece
    
    @State var offset : CGSize = CGSize.zero
    var body: some View {
        
        let dimension = CGFloat(manager.blockSize) * 0.8
        let dragGest = DragGesture()
            .onChanged({ value in
                offset = value.translation
            })
            .onEnded { _ in
                offset = CGSize.zero
            }
        Image(piece.player == .home ? "homePiece" : "awayPiece")
            .resizable()
            .frame(width: dimension , height: dimension)
            .position(manager.positionFor(piece))
            .offset(offset)
            .gesture(dragGest)
            
            
    }
}

#Preview {
    PieceView(piece: Piece.standard)
        .environmentObject(GameManager())
}
