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
    let id : Int
    var status : Status
    static let standard = CardInfo(id: 101, status: .unDecided)
}
