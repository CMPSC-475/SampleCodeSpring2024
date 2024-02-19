//
//  Manager+Location.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import Foundation
import CoreLocation

// Manager will be Locationmanager's delegate
// TODO: Conform to CLLocationManagerDelegate
extension Manager {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
