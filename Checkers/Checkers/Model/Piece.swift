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

/*
struct Offset {
    let x : Int
    let y : Int
}
 */


struct Position : Hashable {
    var row : Int = 0
    var col : Int = 0
}


struct Piece : Identifiable {

    var position : Position
    var player : Player
    var number : Int // we give each player's piece its initial column number
    var id = UUID()  //: Int {hashValue}
    
    static let standard = Piece(position: Position(), player: .home, number: 1)
    
}
