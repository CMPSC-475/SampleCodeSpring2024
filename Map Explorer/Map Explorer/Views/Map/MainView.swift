//
//  ContentView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let stateCollege = CLLocationCoordinate2D(latitude: 40.79550030, longitude: -77.85900170)
    
    init(coord: Coord) {
        self = CLLocationCoordinate2D(latitude: coord.latitude, longitude: coord.longitude)
    }
    
}

struct MainView: View {
    @EnvironmentObject var manager : Manager
    
    @State private var camera : MapCameraPosition = .automatic
    
    @State var selectedFavorite : Favorite?

    var body: some View {
        
        Map(position: $camera) {
            //favoriteMarkers
            if manager.isShowingFavorites {
                favoriteAnnotations
            }
        }
        .onAppear {
            camera = .region(MKCoordinateRegion(center: .stateCollege, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
        }
        .safeAreaInset(edge: .top) {
            MapTopControls()

        }
        .sheet(item: $selectedFavorite) { selectedFav in
            PlaceDetailView(place: selectedFav)
        }

    }
}

extension MainView {
    
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
                    selectedFavorite = favorite
                } label: {
                    Image(systemName: "mappin")
                        .font(.system(size: 35))
                        .foregroundStyle(.red)
                }

            }
        }
        
    }
    
    
}


#Preview {
    MainView()
        .environmentObject(Manager())

}
