//
//  Manager.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import Foundation
import MapKit
import SwiftUI

class Manager : ObservableObject {
    
    //MARK: - Annotation Support -
    @Published var favorites = [Favorite(coord: Coord(latitude: 40.79550030, longitude: -77.85900170), title: "Cheese Shoppe"),
                               Favorite(coord: Coord(latitude: +40.79414797, longitude:
                                                    -77.86152899), title: "The Corner Room")]
    
    
    @Published var places = [Place]()
    
    @Published var isShowingFavorites = true
    
    @Published var camera : MapCameraPosition = .region(MKCoordinateRegion(center: .stateCollege, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    
    @Published var region = MKCoordinateRegion(center: .stateCollege, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    func toggleFavorites() {
        isShowingFavorites.toggle()
    }
    
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
