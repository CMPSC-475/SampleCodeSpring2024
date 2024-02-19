//
//  Manager+Search.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import Foundation
import MapKit

extension Manager {
    
    func searchFor(_ category: Category) {
        // perform the search
        let request = MKLocalSearch.Request()
        request.region = region
        request.naturalLanguageQuery = category.rawValue
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            self.places.removeAll()
            
            guard let response = response else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            
            let maptItems = response.mapItems
            for item in maptItems {
                let place = Place(mapItem: item, category: category, customName: nil)
                self.places.append(place)
                
            }
            
        }
        
    }
}
