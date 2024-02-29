//
//  ContentView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI
import MapKit


enum MapKind {
    case SwiftUI, UIKit
}

struct MainView: View {
    @EnvironmentObject var manager : Manager
    @State var camera : MapCameraPosition = .automatic
    @State var interactionMode : MapInteractionModes = .all
    @State var mapKind : MapKind = .UIKit
    
    var body: some View {
        
        MapSelectionView(camera: $camera, mapKind: $mapKind, modes: $interactionMode, selectedPlace: $manager.selectedPlace)
            .sheet(item: $manager.selectedPlace) { selectedPlace in
            PlaceDetailView(place: selectedPlace)
                .presentationDetents([.fraction(0.3)])
            }
            .alert("User's Location", isPresented: $manager.showAlert, actions: {}) {
                Text(manager.userLocationDescription ?? "No Location Found")
            }
            .safeAreaInset(edge: .bottom) {
                ZStack {
                    Color.white
                    MapTopControls(position: $camera, interactionMode: $interactionMode, mapKind: $mapKind)
                }
                .frame(height: 50)
                .padding()
                .shadow(radius: 20)

            }

    }
}




#Preview {
    MainView()
        .environmentObject(Manager())

}
