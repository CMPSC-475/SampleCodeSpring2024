//
//  AtlasManager.swift
//  Atlas-iOS
//
//  Created by Nader Alfares on 4/3/24.
//

import Foundation
import SwiftUI
import Observation


@Observable
class AtlasManager {
    
    
    private let APIURL = "http://localhost:8000/"
    
    private enum APIEndpoints : String, CaseIterable {
        case flights
        case bookFlights = "book-flight"
    }
    
    private func stringForAPI(endpoint: APIEndpoints) -> String {
        return APIURL + endpoint.rawValue
    }
    
    var alertMessage : String = ""
    var showAlert : Bool = false
    
    func getFlights() async throws -> [Flight] {
        //TODO: -
        return []
    }
    
    func fetchFlights(completion: @escaping ([Flight]?, Error?) -> Void) {
        //TODO: -
    }
    
    func bookFlight(booking: BookFlight) {
        //TODO: -
    }
}
