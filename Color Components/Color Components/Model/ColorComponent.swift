//
//  ColorComponent.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import Foundation

struct ColorComponent : Identifiable {
    var red : Double
    var green : Double
    var blue : Double
    let id = UUID()
    static let standard  = ColorComponent(red: 0.6, green: 0.4, blue: 0.3)
}

extension ColorComponent {
    init() {
        red = Double.random(in: 0...1)
        green = Double.random(in: 0...1)
        blue = Double.random(in: 0...1)
    }
    
    var invert : ColorComponent { ColorComponent(red: 1.0-red, green: 1.0-green, blue: 1.0-blue)}
}
