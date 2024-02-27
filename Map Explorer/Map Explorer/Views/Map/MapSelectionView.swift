//
//  MapSelectionView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/26/24.
//

import SwiftUI
import MapKit

struct MapSelectionView: View {
    @EnvironmentObject var manager : Manager
    @Binding var camera : MapCameraPosition
    @Binding var mapKind : MapKind
    @Binding var modes : MapInteractionModes
    @Binding var selectedPlace : Place?
    
    var body : some View {
        switch mapKind {
        case .SwiftUI:
            DowntownMap(camera: $camera, selectedPlace: $selectedPlace, interactionMode: $modes)

        case .UIKit:
            MapViewUIKit()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MapSelectionView(camera: .constant(.automatic), mapKind: .constant(.SwiftUI), modes: .constant(.all), selectedPlace: .constant(Place.standard))
        .environmentObject(Manager())
}
