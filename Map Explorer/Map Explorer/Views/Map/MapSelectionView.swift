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
    @Binding var mapKind : MapKind
    @Binding var modes : MapInteractionModes
    @Binding var selectedPlace : Place?
    
    var body : some View {
        switch mapKind {
        case .SwiftUI:
            DowntownMap(selectedPlace: $selectedPlace, interactionMode: $modes)

        case .UIKit:
            Text("Add MKMapView Here")
        }
    }
}

#Preview {
    MapSelectionView(mapKind: .constant(.SwiftUI), modes: .constant(.all), selectedPlace: .constant(Place.standard))
        .environmentObject(Manager())
}
