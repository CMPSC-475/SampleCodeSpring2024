//
//  StatesManager.swift
//  US States
//
//  Created by Nader Alfares on 3/11/24.
//

import Foundation
import Observation

typealias USStates = [USState]
@Observable
class StatesManager {
    var theStates : USStates

    private let persistence : Persistence<USStates>
    
    init() {
        let filename = "StateData"
        persistence = Persistence<USStates>(filename:filename)
        
        let _theStates = persistence.modelData ?? []
        theStates = _theStates
    }
    
    
}
