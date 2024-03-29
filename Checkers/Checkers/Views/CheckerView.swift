//
//  CheckerView.swift
//  Checkers
//
//  Created by Nader Alfares on 2/5/24.
//

import SwiftUI

struct CheckerView: View {
    @EnvironmentObject var manager : GameManager
    @Binding var piece : Piece
    @State private var offset = CGSize.zero

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged{ (value) in
                offset = value.translation
            }
            .onEnded { (value) in
                withAnimation {
                    let offset = manager.offset(for: piece, from: offset)
                    piece.moveBy(offset: offset)
                    self.offset = CGSize.zero
                }
            }
        
       PieceView(piece: piece)
            .position(manager.positionFor(piece))
            .offset(offset)
            .gesture(dragGesture)  // gesture needs to go after position/offset
    }
}

#Preview {
    CheckerView(piece: .constant(Piece.standard))
        .environmentObject(GameManager())
}
