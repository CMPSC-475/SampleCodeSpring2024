//
//  MapViewUIKit.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/26/24.
//

import Foundation
import MapKit
import SwiftUI


struct MapViewUIKit : UIViewRepresentable {
    @EnvironmentObject var manager : Manager
 
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.region = manager.region
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        mapView.addAnnotations(manager.places)
        mapView.addOverlay(manager.downtownOverlay)
        mapView.addOverlays(manager.polylines)
        

    }
    
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator()
    }
}


#Preview {
    MapViewUIKit()
        .environmentObject(Manager())
}

