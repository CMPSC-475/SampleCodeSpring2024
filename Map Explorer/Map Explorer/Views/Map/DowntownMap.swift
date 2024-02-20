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
    @State private var camera : MapCameraPosition = .automatic
    @Binding var selectedPlace : Place?
    
    
    var body: some View {
        Map(position: $camera, selection:$selectedPlace) {
            //favoriteMarkers
            if manager.isShowingFavorites {
                favoriteAnnotations
            }
            
            places
        
        }
        .onMapCameraChange{ context in
            manager.region = context.region
        }
//        .mapControls{
//            MapCompass()
//            MapPitchToggle()
//        }
        .mapStyle(.standard(pointsOfInterest: [.bank]))
        .safeAreaInset(edge: .top) {
            ZStack {
                Color.white
                MapTopControls()
            }
            .frame(height: 50)
            .padding()
            .shadow(radius: 20)

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
    
    
}

#Preview {
    DowntownMap(selectedPlace: .constant(Place.standard))
        .environmentObject(Manager())
}
