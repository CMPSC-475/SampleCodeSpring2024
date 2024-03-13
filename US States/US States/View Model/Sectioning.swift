//
//  Sectioning.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import Foundation

enum Sectioning: String, CaseIterable, Codable {
    case none = "None",
         byName = "By Name",
         byDecade = "By Decade"
}

struct SectionInfo : Identifiable {
    let title : String  // title for section
    let indicies : [Int]  // indices of states for section
    var id : String {title}
}
