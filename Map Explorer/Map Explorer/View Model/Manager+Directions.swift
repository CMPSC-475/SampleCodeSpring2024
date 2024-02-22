//
//  Manager+Directions.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import Foundation
import MapKit

extension Manager {
    func provideDirections(for place: Place) {
        
        let request = MKDirections.Request()
        request.destination = place.mapItem
        request.source = MKMapItem.forCurrentLocation()
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            guard error == nil else {return}
            if let route = response?.routes.first {
                self.routes.append(route)
            }
        }
        
        
    }
    
}
