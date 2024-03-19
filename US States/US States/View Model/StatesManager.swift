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
    
    var centuries : [Int] {
        return Array(Set(theStates.map({ $0.centuryFounded })))
    }
    
    init() {
        let filename = "StateData"
        persistence = Persistence<USStates>(filename:filename)
        
        let _theStates = persistence.modelData ?? []
        theStates = _theStates
    }
    
    
    //MARK: Formatting
    func formatted(year:Int) -> String {
        String(format: "%04d",year)
    }
    
    func indexFor(id: String) -> Int? {
        return theStates.firstIndex(where: {$0.id == id})
    }
    
    func centuryTitle(for century:Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        let ordinal = formatter.string(from: NSNumber(value: century + 1))!
        let title = "Founded in the \(ordinal) century"
        return title
    }
 
    
    
}
