//
//  Category.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import Foundation

enum Category : String, CaseIterable {
    case airport, bar, coffee, dining, gas = "Gas Station"
    case grocery, hospital, hotel, laundry, library, movies, parking
    case shopping //,pizza
    
    var systemName : String {
        switch self {
        case .airport:
            return "airplane"
        case .bar:
            return "wineglass"
        case .coffee:
            return "cup.and.saucer"
        case .dining:
            return "fork.knife"
        case .gas:
            return "fuelpump"
        case .grocery:
            return "basket"
        case .hospital:
            return "cross"
        case .hotel:
            return "bed.double"
        case .laundry:
            return "washer"
        case .library:
            return "books.vertical"
        case .movies:
            return "film"
        case .parking:
            return "parkingsign"
        case .shopping:
            return "handbag"
        }
    }
}
