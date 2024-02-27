//
//  Manager.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import Foundation
import MapKit
import SwiftUI

class Manager : NSObject, ObservableObject {
    
    //MARK: - Annotation Support -
    @Published var favorites = [Favorite(coord: Coord(latitude: 40.79550030, longitude: -77.85900170), title: "Cheese Shoppe"),
                               Favorite(coord: Coord(latitude: +40.79414797, longitude:
                                                    -77.86152899), title: "The Corner Room")]
    
    
    @Published var places = [Place]()
    @Published var routes = [MKRoute]()
    
    var polylines : [MKPolyline] {routes.map { $0.polyline }}
    
    // circular regions
    @Published var currentCircularRegion : CircleRegion?
    @Published var circularRegions : [CircleRegion] = []
    
    
    @Published var isShowingFavorites = true
    
    @Published var camera : MapCameraPosition = .region(MKCoordinateRegion(center: .stateCollege, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    
    @Published var region = MKCoordinateRegion(center: .stateCollege, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    let locationManager : CLLocationManager
    
    
    @Published var userLocationDescription : String?
    @Published var showAlert : Bool = false
    
    var downtownOverlay : MKPolygon {MKPolygon(coordinates: CLLocationCoordinate2D.downtownCoordinates, count: CLLocationCoordinate2D.downtownCoordinates.count)}
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
    }
    
    func toggleFavorites() {
        isShowingFavorites.toggle()
    }
    

    func clearAll() {
        places.removeAll()
        circularRegions.removeAll()
        routes.removeAll()
    }
    
}
