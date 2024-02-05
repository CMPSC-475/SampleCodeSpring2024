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
    
}
