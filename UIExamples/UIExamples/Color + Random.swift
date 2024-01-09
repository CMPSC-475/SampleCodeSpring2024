//
//  Color + Random.swift
//  UIExamples
//
//  Created by Nader Alfares on 1/9/24.
//

import Foundation
import SwiftUI

extension Color {

    static var randomColor : Color {return Color(
        red: Double.random(in: 0.0...1.0),
        green: Double.random(in: 0.0...1.0),
        blue: Double.random(in: 0.0...1.0) )}
}
