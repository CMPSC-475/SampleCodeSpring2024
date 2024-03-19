//
//  USState.swift
//  US States
//
//  Created by Nader Alfares on 3/11/24.
//

import Foundation

struct USState : Codable  {
    let name : String
    let capital : String
    let info : String
    let admissionYear : Int
    var favorite : Bool
    var visited : Bool
    let images : [String]
    let stateBird : String?
    
    static let standard = USState(name: "Pennsyltucky", capital: "MiddleOfNowhere", info: "Welcome to Pennsyltucky", admissionYear: 1776, favorite: true, visited: true, images: [], stateBird: "Ruffed Grouse")
}


//Computed Properties
extension USState {
    var firstLetter : String {String(name.prefix(1))}
    var decadeAdmitted : String  {String(admissionYear - admissionYear%10)}
    var empty : String {""}  // for no sectioning
}


//Identifiable
extension USState : Identifiable {
    var id : String { name }
}

// Decodable
extension USState {
    
    enum CodingKeys: String, CodingKey {
        case name = "state"
        case admissionYear = "year"
        case stateBird = "bird"
        case capital
        case info
        case favorite
        case visited
        case images
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        capital = try values.decode(String.self, forKey: .capital)
        info = try values.decode(String.self, forKey: .info)
        admissionYear = try values.decode(Int.self, forKey: .admissionYear)
        images = try values.decode([String].self, forKey: .images)
        stateBird = try values.decodeIfPresent(String.self, forKey: .stateBird)
        favorite = try values.decodeIfPresent(Bool.self, forKey: .favorite) ?? false
        visited = try values.decodeIfPresent(Bool.self, forKey: .visited) ?? false
    }

}

extension USState  {
    
}
