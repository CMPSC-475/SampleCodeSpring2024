//
//  CheerManager.swift
//  WeAre
//
//  Created by Nader Alfares on 1/11/24.
//

import Foundation
import SwiftUI

class CheerManager : ObservableObject {
    @Published var isFirstCheerVisisble = false
    @Published var isSecondCheerVisible = false
    
    private var cheerCount = 0
    
    func cheer() {
        withAnimation {
            cheerCount += 1
            isFirstCheerVisisble = cheerCount%2 == 1
            isSecondCheerVisible = cheerCount%2 == 0
        }
    }
    
}
