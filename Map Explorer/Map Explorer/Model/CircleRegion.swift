//
//  CircleRegion.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/21/24.
//

import Foundation
import MapKit

struct CircleRegion : Identifiable {
    let center: Coord
    var radius : Double
    var id = UUID()
    
    mutating func updateRadius(to newRadius:Double) {
        radius = newRadius
    }
}

//for distinguishing between current circle region and existing regions (from dragging)
enum RegionType : String, CaseIterable {
    case current, done
}

extension CircleRegion {
    
    // make use of overlay title property to distinguish type of mkCircle (raw value of Region type is used)
    func overlayWithTitle(_ title:String) -> MKCircle {
        let center = CLLocationCoordinate2D(coord: self.center)
        let radius = self.radius
        let overlay = MKCircle(center: center, radius: radius)
        overlay.title = title
        return overlay
    }
}
