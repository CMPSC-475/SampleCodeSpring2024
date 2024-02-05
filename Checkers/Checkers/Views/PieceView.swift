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
    let pieceScaleFactor = 0.8
    var body: some View {
        let dimension = CGFloat(manager.blockSize) * pieceScaleFactor
        Image(piece.player == .home ? "homePiece" : "awayPiece")
            .resizable()
            .frame(width:dimension,height: dimension)
    }
}

#Preview {
    PieceView(piece: Piece.standard)
        .environmentObject(GameManager())
}
