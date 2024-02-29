//
//  MapViewCoordinator.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/26/24.
//

import Foundation
import MapKit


class MapViewCoordinator : NSObject, MKMapViewDelegate {
    let manager : Manager
    
    init(manager: Manager) {
        self.manager = manager
    }
    
    

    
    //MARK: MapView Delegate
    
    // called when Map needs to display an annotation on the map
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //TODO: complete this code
       let markerID = "Place"
       let clusterID = "Cluster"
       switch annotation {
       case is MKClusterAnnotation:
           let cluster = annotation as! MKClusterAnnotation
           let clusterView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: clusterID)
           clusterView.markerTintColor = .blue
           clusterView.glyphText = "\(cluster.memberAnnotations.count)"
           return clusterView
       case is Place:
           let marker =  (mapView.dequeueReusableAnnotationView(withIdentifier: markerID) ??
           MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: markerID)) as! MKMarkerAnnotationView
           marker.clusteringIdentifier = markerID
          if let place = annotation as? Place {
             marker.glyphImage = UIImage(systemName: place.category.systemName)
             marker.glyphTintColor = .purple
             marker.markerTintColor = .orange
           }
           return marker
           
       default:
           return nil
           
       }
       
    }
    
    func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {
        return MKClusterAnnotation(memberAnnotations: memberAnnotations)
    }
    
    
    
 
    // Callout Accessory triggers this function
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

        
    }
    
    // Called when Map needs to display an overlay on the map
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        switch overlay {
        case is MKPolygon:
            let polygonRenderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
            polygonRenderer.strokeColor = UIColor.red
            polygonRenderer.lineWidth = 2.0
            polygonRenderer.fillColor = UIColor.blue.withAlphaComponent(0.3)
            return polygonRenderer
        case is MKPolyline:
            let polyLineRenderer = MKPolylineRenderer(overlay: overlay)
            polyLineRenderer.strokeColor = UIColor.red
            polyLineRenderer.lineWidth = 4.0
            return polyLineRenderer
            
        case is MKCircle:
            let circleRenderer =  MKCircleRenderer(circle: overlay as! MKCircle)
            circleRenderer.lineWidth = 2.0
            let color = overlay.title == RegionType.current.rawValue ? UIColor.blue : UIColor.lightGray
            circleRenderer.strokeColor = color
            circleRenderer.fillColor = color.withAlphaComponent(0.3)
            return circleRenderer
            
        default:
            assert(false, "Unhandled Overlay")
        }

    }
    
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        if let selectedPlace = annotation as? Place {
            self.manager.selectedPlace = selectedPlace
        }
    }
    
    
    var centerCoordinate : CLLocationCoordinate2D?
    @objc
    func dragHandler(recognizer: UIPanGestureRecognizer){
        let mapView = recognizer.view! as! MKMapView
        switch recognizer.state {
        case .began:
            let point = recognizer.location(in: mapView)
            let center = mapView.convert(point, toCoordinateFrom: mapView)
            manager.updateCurrentRegion(center: center, edge: center)
            centerCoordinate = center
        case .changed:
            let point = recognizer.location(in: mapView)
            let edge = mapView.convert(point, toCoordinateFrom: mapView)
            manager.updateCurrentRegion(center: centerCoordinate!, edge: edge)
            
        case .ended:
            manager.addRegion()
            
        default:
            break
        }
    }
    
    
    
}

