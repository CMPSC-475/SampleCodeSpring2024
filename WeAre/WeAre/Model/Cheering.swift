//
//  Cheering.swift
//  WeAre
//
//  Created by Nader Alfares on 1/16/24.
//

import Foundation

protocol Cheering {
    var initialCheer : OneCheer { get }
    var firstRound : CheerRound { get }
    var secondRound : CheerRound { get }
}

struct OneCheer {
    let title : String
    let imageName : String
}

struct CheerRound {
    let count : Int
    let firstCheer : OneCheer
    let secondCheer : OneCheer
}


struct PSUCheer : Cheering {
    var initialCheer: OneCheer = OneCheer(title: "", imageName: "Mascot 0")
    var firstRound: CheerRound = CheerRound(count: 3, firstCheer: OneCheer(title: "We Are", imageName: "Mascot 1"), secondCheer: OneCheer(title: "Penn State", imageName: "Mascot 1 Reversed"))
    var secondRound: CheerRound = CheerRound(count: 1, firstCheer: OneCheer(title: "Thank You", imageName: "Mascot 2"), secondCheer: OneCheer(title: "You're Welcome", imageName: "Mascot 2 Reversed"))

}

extension Cheering {
    var totalCheers : Int { (firstRound.count + secondRound.count) * 2 + 1}
}
