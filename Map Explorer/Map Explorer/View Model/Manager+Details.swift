//
//  Manager+Details.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/20/24.
//

import Foundation
import MapKit


extension Manager {
    func poiCategoryStringFrom(_ poi:MKPointOfInterestCategory?) -> String {
        guard let poiString = poi else {return ""}
        return poiString.rawValue.replacingOccurrences(of: "MKPOICategory", with: "")
    }
    func infoFrom(_ placeMark: CLPlacemark) -> String {
        let info = (placeMark.subThoroughfare ?? "" ) + " " + (placeMark.thoroughfare ?? "")
        return info
    }
    
   
}
