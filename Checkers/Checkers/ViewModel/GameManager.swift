//
//  GameManager.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import Foundation


class GameManager : ObservableObject {
    
    @Published var preferences : Preferences

    
    @Published var blockSize = 80
    @Published var pieces : [Piece]
    
    var boardSize : Int {preferences.boardDimension}
    
 
    
    // initialize preferences and pieces model
    init() {
        preferences = Preferences()
        pieces = [Piece]()
        initializePieces()

    }
    
    private func initializePieces() {
        for i in 0..<preferences.boardDimension {
            let homePiece = Piece(position: Position(row: 0, col: i), player: .home, number: i)
            pieces.append(homePiece)
            let awayPiece = Piece(position: Position(row: preferences.boardDimension-1, col: i), player: .away, number: i)
            pieces.append(awayPiece)
        }
    }
    
    private func resetPieces() {
        //put pieces back into their initial position

    }
    
    
    // Intents
    func resetGame() {
        resetPieces()
    }
}
