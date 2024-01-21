//
//  ColorManager.swift
//  Color Components
//
//  Created by Nader Alfares on 1/21/24.
//

import Foundation

class ColorManager : ObservableObject {

    @Published var components : [ColorComponent] = []
    
    func addColor() {
        components.append(ColorComponent())
    }
    
    func deleteLast() {
        components.removeLast()
    }
    
    func clearColors() {
        components.removeAll()
    }
    
    func invertColors() {
        let newComponents = components.map { c in
            c.invert
        }
        components = newComponents
    }
    
}
