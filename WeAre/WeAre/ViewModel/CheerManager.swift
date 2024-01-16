//
//  CheerManager.swift
//  WeAre
//
//  Created by Nader Alfares on 1/11/24.
//

import Foundation
import SwiftUI

class CheerManager : ObservableObject {
    // THE MODEL
    let cheers : Cheering = PSUCheer()
    
    var isFirstCheerVisisble : Bool {cheerState == .weare || cheerState == .thankyou}
    var isSecondCheerVisible : Bool {cheerState == .pennstate || cheerState == .yourwelcom}
    
    
    enum CheerState {
        case ready, weare, pennstate, thankyou, yourwelcom
    }
    
    @Published var cheerState = CheerState.ready
    
    private var cheerCount = 0 {
        didSet {
            // excutes when cheerCount is updated
            if cheerCount == 0 {
                cheerState = .ready
            } else if cheerCount <= cheers.firstRound.count * 2 {
                cheerState = (cheerCount>0  && cheerCount%2 == 1) ? .weare : .pennstate
            } else {
                cheerState = (cheerCount>0  && cheerCount%2 == 1) ? .thankyou : .yourwelcom
            }
        }
    }
    
    func cheer() {
        cheerCount = (cheerCount + 1) % cheers.totalCheers
    }
    
}
