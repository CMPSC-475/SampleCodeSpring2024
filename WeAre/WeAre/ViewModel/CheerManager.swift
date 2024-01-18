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
    
//    var cheerText : String {
//        switch cheerState {
//        case .ready:
//            cheers.initialCheer.title
//        case .weare:
//            cheers.firstRound.firstCheer.title
//        case .pennstate:
//            cheers.firstRound.secondCheer.title
//        case .thankyou:
//            cheers.secondRound.firstCheer.title
//        case .yourwelcom:
//            cheers.secondRound.secondCheer.title
//        }
//    }
//    
//    var cheerImageName : String {
//        switch cheerState {
//        case .ready:
//            cheers.initialCheer.imageName
//        case .weare:
//            cheers.firstRound.firstCheer.imageName
//        case .pennstate:
//            cheers.firstRound.secondCheer.imageName
//        case .thankyou:
//            cheers.secondRound.firstCheer.imageName
//        case .yourwelcom:
//            cheers.secondRound.secondCheer.imageName
//        }
//    
//    }
    
    
    var currentCheer : OneCheer {
        switch cheerState {
        case .ready:
            cheers.initialCheer
        case .weare:
            cheers.firstRound.firstCheer
        case .pennstate:
            cheers.firstRound.secondCheer
        case .thankyou:
            cheers.secondRound.firstCheer
        case .yourwelcom:
            cheers.secondRound.secondCheer
        }
    }
    
    
    
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
