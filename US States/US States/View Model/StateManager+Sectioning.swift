//
//  StateManager+Sectioning.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import Foundation

extension StatesManager {
    
    
    func sectionInfo(for sec: Sectioning) -> [SectionInfo] {
        switch sec {
            
        case .none:
            let ids = Set(theStates.map{$0.id})
            return [SectionInfo(title: "", identifiers: ids )]
            
        case .byName:
            return sectionInfo(kp: \USState.firstLetter)
            
        case .byDecade:
            return sectionInfo(kp: \USState.decadeAdmitted)
            
        }
    }
    
    private func sectionInfo(kp: KeyPath<USState, String>) -> [SectionInfo] {
        let titles = Set(theStates.map {$0[keyPath: kp]})
        let info = titles.map { t in
            SectionInfo(title: t, identifiers: identifiers(for: {s in s[keyPath: kp] == t}))
        }
        return info.sorted { $0.title < $1.title}
        
    }
    
    private func identifiers(for property: (USState) -> Bool) -> Set<String> {
        let filteredStates = theStates.filter(property)
        let ids = filteredStates.map { $0.id }
        return Set(ids)
        
    }
    
    
    
    

    
}
