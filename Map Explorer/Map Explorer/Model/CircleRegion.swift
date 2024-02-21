//
//  CircleRegion.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/21/24.
//

import Foundation

struct CircleRegion {
    let center: Coord
    var radius : Double
    var id = UUID()
    
    mutating func updateRadius(to newRadius:Double) {
        radius = newRadius
    }
}
