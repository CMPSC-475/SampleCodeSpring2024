//
//  CLLocationsCoorsdinate2D+utils.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/20/24.
//

import Foundation
import MapKit


extension CLLocationCoordinate2D {
    static let stateCollege = CLLocationCoordinate2D(latitude: 40.79550030, longitude: -77.85900170)
    
    init(coord:Coord) {
        self = CLLocationCoordinate2D(latitude: coord.latitude, longitude: coord.longitude)
    }
    
    var coord : Coord {
        Coord(latitude: self.latitude, longitude: self.longitude)
    }
    
    static let downtownCoordinates = [(40.791831951313,-77.865203974557),
                               (40.800364570711,-77.853778542571),
                               (40.799476294037,-77.8525124806654),
                               (40.7908968034537,-77.8638607142546)].map {(a,b) in CLLocationCoordinate2D(latitude: a, longitude: b)}
    
    // Need distance between two coordinates.  CoreLocation provides distance between two locations
    func distance(from other:CLLocationCoordinate2D) -> CLLocationDistance {
        let origin = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let destination = CLLocation(latitude: other.latitude, longitude: other.longitude)
        return origin.distance(from: destination)
        
    }
}
