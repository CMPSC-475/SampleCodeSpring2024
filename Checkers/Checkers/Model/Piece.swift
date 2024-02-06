//
//  Piece.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import Foundation

enum Player {
    case home, away
}


struct Offset {
    let x : Int
    let y : Int
    
    static func +(lhs: Position, rhs: Offset) -> Position {
        Position(row: lhs.row + rhs.y, col: lhs.col + rhs.x)
    }
}


struct Position : Hashable {
    var row : Int = 0
    var col : Int = 0
    
    static func +(rhs: Offset, lhs: Position) -> Position {
        Position(row: lhs.row + rhs.y, col: lhs.col + rhs.x)
    }
    
}


struct Piece : Identifiable {

    var position : Position
    var player : Player
    var number : Int // we give each player's piece its initial column number
    var id = UUID()  //: Int {hashValue}
    
    static let standard = Piece(position: Position(), player: .home, number: 1)
    
}


extension Piece {
    
    mutating func moveBy(offset: Offset) {
        position = position + offset
    }
    
    mutating func to(_ position: Position) {
        self.position = position
    }
    
    
    
}
