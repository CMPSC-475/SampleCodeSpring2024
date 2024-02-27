//
//  DowntownMap.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/20/24.
//

import SwiftUI
import MapKit

struct DowntownMap: View {
    @EnvironmentObject var manager : Manager
    @Binding var camera : MapCameraPosition
    @Binding var selectedPlace : Place?
    @Binding var interactionMode : MapInteractionModes
    
    var body: some View {
        
        MapReader { proxy in
            
            let dragGesture = DragGesture()
                .onChanged { value in
                    guard !(interactionMode == .all) else {return}
                    let centerPoint = value.startLocation
                    let edgePoint = value.location
                    //conversion
                    let centerCoordinate = proxy.convert(centerPoint, from: .local)!
                    let edgeCoordinate = proxy.convert(edgePoint, from: .local)!
                    
                    manager.updateCurrentRegion(center: centerCoordinate, edge: edgeCoordinate)
                    
                }
                .onEnded { value in
                    guard !(interactionMode == .all) else {return}
                    manager.addRegion()
                }
            Map(position: $camera,
                interactionModes: interactionMode,
                selection:$selectedPlace) {
                //favoriteMarkers
                if manager.isShowingFavorites {
                    favoriteAnnotations
                }
                
                places
                
                UserAnnotation()
                
                regions
                
                // if a route is requested, show polylines
                if let route = manager.routes.first {
                    ForEach(route.steps, id:\.self) { step in
                        MapPolyline(step.polyline)
                            .stroke(.black, lineWidth: 5.0)
                    }
                    
                }
                
            }
                .gesture(dragGesture)
                .onMapCameraChange{ context in
                    manager.region = context.region
                }
                .mapStyle(.standard(pointsOfInterest: [.bank]))
        }

    }
}

extension DowntownMap {
    
    var favoriteMarkers : some MapContent {
        ForEach(manager.favorites) { favorite in
            Marker(favorite.title, coordinate: .init(coord: favorite.coord))
                .tint(.cyan)
        }
    }
    
    
    var favoriteAnnotations : some MapContent {
        ForEach(manager.favorites) { favorite in
            Annotation(favorite.title, coordinate:
                    .init(coord: favorite.coord)) {
                
                Button {
//                    selectedFavorite = favorite
                } label: {
                    Image(systemName: "mappin")
                        .font(.system(size: 35))
                        .foregroundStyle(.red)
                }

            }
        }
        
    }
    
    var places : some MapContent {
        ForEach(manager.places) {
            place in
            Marker(place.name, systemImage: place.category.systemName, coordinate: place.coordinate)
                .tag(place)
        }
        
    }
    
    var regions : some MapContent {
        Group {
            ForEach(manager.circularRegions) { region in
                MapCircle(center: CLLocationCoordinate2D(coord: region.center), radius: region.radius)
                    .foregroundStyle(Color.black.opacity(0.3))
            }
            
            if let currentRegion = manager.currentCircularRegion {
                MapCircle(center: CLLocationCoordinate2D(coord: currentRegion.center), radius: currentRegion.radius)
                    .foregroundStyle(Color.blue.opacity(0.3))
            }
        }
    }
    
    
}

#Preview {
    DowntownMap(camera: .constant(.automatic), selectedPlace: .constant(Place.standard),
                interactionMode: .constant(.all))
        .environmentObject(Manager())
}
