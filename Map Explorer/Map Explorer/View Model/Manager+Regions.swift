//
//  Manager+Regions.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/22/24.
//

import Foundation
import MapKit

extension Manager {
    
    func updateCurrentRegion(center: CLLocationCoordinate2D, edge: CLLocationCoordinate2D) {
        let radius = center.distance(from: edge)
        if currentCircularRegion == nil {
            currentCircularRegion = CircleRegion(center: center.coord, radius: radius)
        } else {
            currentCircularRegion!.updateRadius(to: radius)
        }
        
    }
    
    func addRegion() {
        if let region = currentCircularRegion {
            circularRegions.append(region)
            currentCircularRegion = nil
        }
    }
    
    
    
}
