//
//  Manager+Color.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import Foundation
import SwiftUI

//Convenience function to convert model data to view Color
extension ColorManager {
    func colorForComponent(_ component:ColorComponent) -> Color {
        let color = Color(red: component.red, green: component.green, blue: component.blue)
        return color
    }
}
