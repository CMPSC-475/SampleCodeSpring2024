//
//  DroppedPin.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/26/24.
//

import Foundation
import MapKit

class DroppedPin : NSObject, MKAnnotation {
        var coordinate: CLLocationCoordinate2D
        var title: String?
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
