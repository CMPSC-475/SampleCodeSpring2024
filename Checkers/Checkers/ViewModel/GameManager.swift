//
//  GameManager.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import Foundation


class GameManager : ObservableObject {
    
    // our Model consists of the preferences, the block size of the game board, and the array of game pieces
    @Published var preferences : Preferences {
        didSet {
            // preference change means we changed the board dimension so we need to reset block size
            blockSize = boardWidth/boardSize
            initializePieces()
        }
    }

    
    @Published var blockSize = 80
    @Published var pieces : [Piece]
    
    var boardSize : Int {preferences.boardDimension}
    
 
    // the width (in points) of the board. used to determine the blocksize and size of game pieces.  A Geometry Reader in the main app provides this value
    private var boardWidth : Int = 0 {
        didSet {
            // boardWidth change means we need to change blocksize
            blockSize =  boardWidth/boardSize
        }
    }
    
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
    
    // size of window from main app Geometry Window
    func setBoardWidth(_ width:Int) {
        boardWidth = width
    }
}
