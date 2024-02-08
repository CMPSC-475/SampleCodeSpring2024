//
//  Manager.swift
//  BaseballCards
//
//  Created by Nader Alfares on 2/6/24.
//

import Foundation

enum SwipeDirection {
    case left, right, none
    
    static func afterMoving(x: CGFloat) -> SwipeDirection {
        let threshold : CGFloat = 100
        if x > threshold {
            return .right
        } else if x < -threshold {
            return .left
        } else {
            return .none
        }
    }
}

class Manager : ObservableObject {
    
    @Published var cards : [CardInfo]
    
    private let firstCardNumber = 101
    private let lastCardNumber = 131
    
    var tradedCount : Int {cards.filter{ $0.status == .traded}.count }
    var keptCount : Int {cards.filter{$0.status == .kept}.count }
    
    init() {
        self.cards = (firstCardNumber...lastCardNumber).map({ num in
            CardInfo(imageNumber: num, status: .unDecided)
        })
    }
    
    func imageNameFor(_ card: CardInfo) -> String {
        "\(card.imageNumber)"
    }
    
    func newStateAfter(_ d: SwipeDirection) -> Status {
        switch d {
        case .left:
            return .traded
        case .right:
            return .kept
        case .none:
            return .unDecided
        }
        
    }
    
    func reset() {
      //TODO: -
        cards.indices.forEach { i in
            cards[i].updateStatus(.unDecided)
        }
    }
    
    
    
}
