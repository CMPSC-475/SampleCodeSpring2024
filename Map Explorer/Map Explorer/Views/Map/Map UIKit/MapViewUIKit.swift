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
    @Binding var modes : MapInteractionModes
 
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.region = manager.region
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
        mapView.delegate = context.coordinator
        
        let dragGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(MapViewCoordinator.dragHandler(recognizer:)))
        
        mapView.addGestureRecognizer(dragGesture)
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        
        switch modes {
        case .all:
            mapView.isScrollEnabled = true
        default:
            mapView.isScrollEnabled = false
        }
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        mapView.addAnnotations(manager.places)
        mapView.addOverlay(manager.downtownOverlay)
        mapView.addOverlays(manager.polylines)
        mapView.addOverlays(manager.circularRegions.map({ $0.overlayWithTitle(RegionType.done.rawValue)
        }))
        
        if let current = manager.currentCircularRegion {
            mapView.addOverlay(current.overlayWithTitle(RegionType.current.rawValue))
        }
        
        

    }
    
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(manager: manager)
    }
}


#Preview {
    MapViewUIKit(modes: .constant(.all))
        .environmentObject(Manager())
}

