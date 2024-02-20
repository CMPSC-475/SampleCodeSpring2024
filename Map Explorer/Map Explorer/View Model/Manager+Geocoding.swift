//
//  Manager+Geocoding.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import Foundation
import MapKit

extension Manager {
    
    func geocodeFor(_ restaurant: Restaurant) {
        self.places.removeAll()
        let gecoder = CLGeocoder()
        gecoder.geocodeAddressString(restaurant.address) { placeMarks, error in
            guard error == nil else {print(error!.localizedDescription); return}
            
            if let placeMarks = placeMarks {
                guard let placeMark = placeMarks.first else {return}
                let mapMark = MKPlacemark(placemark: placeMark)
                let mapItem = MKMapItem(placemark: mapMark)
                let place = Place(mapItem: mapItem, category: .dining, customName: restaurant.name)
                self.places.append(place)
                
            }
        }
    }
    
    func geocodeCurrentLocation() {
        guard let currentLocation = locationManager.location else {return}
        let gecoder = CLGeocoder()
        gecoder.reverseGeocodeLocation(currentLocation) { placeMark, error in
            guard error == nil else {return}
            if let placeMark = placeMark?.first {
                self.userLocationDescription =  placeMark.thoroughfare
                self.showAlert = true
            }
        }
        
    }
    
}
