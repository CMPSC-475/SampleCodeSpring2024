//
//  GameManager+CG.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import Foundation

extension GameManager {
    // translate model position (row,col) to view position
    func positionFor(_ piece: Piece) -> CGPoint {
        let x = (CGFloat(piece.position.col) + 0.5) * CGFloat(blockSize)
        let y = (CGFloat(piece.position.row) + 0.5) * CGFloat(blockSize)
        return CGPoint(x: x, y: y)
    }
    
    
//    // Convert from view's CGSize to Model's Size
//    private func offset( for size:CGSize) -> Offset {
//        //TODO: -    }
//    
//    // home team moves y = +1, x = -1,0,1;
//    // away team moves y = -1, x = -1,0,1
//    func legal(_ offset:Offset, for player:Player) -> Bool {
//        //TODO: -
//    }
//
//    func offset(for piece:Piece, from size:CGSize) -> Offset {
//        //TODO: -
//    }
    
}
