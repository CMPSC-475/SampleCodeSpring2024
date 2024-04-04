//
//  Flight.swift
//  Atlas-iOS
//
//  Created by Nader Alfares on 4/3/24.
//

import Foundation


struct Flight : Hashable, Identifiable, Codable {
    var id: Int
    var flight_id: String
    var origin: String
    var destination: String
    var departure: String
    var arrival: String
    var price : Float
    
    static let standard = Flight(id: 0, flight_id: "DEF456", origin: "London (LHR)", destination: "Tokyo (HND)", departure: "2024-04-03T13:45:00", arrival: "2024-04-04T08:20:00", price: 200.0)
}

struct BookFlight : Codable {
    var flight_id: Int
    var passengerName : String
    var passegnerEmail : String
    
    enum CodingKeys: String, CodingKey {
        case flight_id
        case passengerName = "passenger_name"
        case passegnerEmail = "passenger_email"
    }
}
