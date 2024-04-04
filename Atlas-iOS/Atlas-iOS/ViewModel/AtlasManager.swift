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
    
    var isLoading : Bool = false
    
    func getFlights() async throws -> [Flight] {
        //TODO: -
        
        var flights : [Flight] = []
        guard let url = URL(string: stringForAPI(endpoint: .flights)) else {
            print("invalid URL")
            return []
            
        }
    
        let session = URLSession.shared
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            flights = try decoder.decode([Flight].self, from: data)
            
        } catch {
            print(error)
            flights = []
        }
    
        return flights
    }
    
    func fetchFlights(completion: @escaping ([Flight]?, Error?) -> Void) {
        //TODO: -
        
        guard let url = URL(string: stringForAPI(endpoint: .flights)) else {
            print("invalid URL")
             return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data", code: 0))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let flights = try decoder.decode([Flight].self, from: data)
                completion(flights, nil)
            } catch {
                completion(nil, error)
            }
            
        }
        
        task.resume()
    }
    
    func bookFlight(booking: BookFlight) {
        guard let url = URL(string: stringForAPI(endpoint: .bookFlights)) else {
            print("Invalid URL")
            return
        }
        
            
        guard let postData = try? JSONEncoder().encode(booking) else {
                print("Failed to encode parameters")
                return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let responseString = String(data: data, encoding: .utf8) {
                        self.alertMessage = "Flight Booked!"
                        self.showAlert = true
                    }
                } else {
                    self.alertMessage = "HTTP Status Code: \(httpResponse.statusCode)"
                    self.showAlert = true
                }
            }
        }.resume()
    }
}
