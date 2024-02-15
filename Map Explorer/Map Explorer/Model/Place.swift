//
//  Place.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/15/24.
//

import Foundation
import MapKit

struct Place : Identifiable, Hashable {
    let mapItem : MKMapItem
    let category : Category
    let customName : String?
    var id = UUID()
    
    var name : String {customName ?? mapItem.placemark.name ?? ""}
    var coordinate : CLLocationCoordinate2D {mapItem.placemark.coordinate}
    
    static let standard = Place(mapItem: MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.794561399999999, longitude: -77.861210400000004), addressDictionary: ["Thoroughfare":"E College Ave", "ZIP": "16801", "SubAdministrativeArea": "Centre County", "Country": "United States", "Street": "110 E College Ave", "State": "PA","SubThoroughfare": "110","CountryCode": "US","Name": "Irving’s","City": "State College", "FormattedAddressLines": ["110 E College Ave", "State College, PA  16801", "United States"]])), category: .coffee, customName: "Irving's", id: UUID())
}
