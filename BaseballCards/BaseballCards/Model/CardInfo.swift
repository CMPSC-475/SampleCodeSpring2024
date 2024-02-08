//
//  CardInfo.swift
//  BaseballCards
//
//  Created by Nader Alfares on 2/6/24.
//

import Foundation

enum Status {
    case unDecided, kept, traded
}

struct CardInfo :Identifiable {
    var id : Int { imageNumber }
    let imageNumber : Int
    var status : Status

    static let standard = CardInfo(imageNumber: 101, status: .unDecided)
    
    mutating func updateStatus(_ status: Status) {
        self.status = status
    }
}
