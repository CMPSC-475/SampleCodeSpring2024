//
//  MapTopControls.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/15/24.
//

import SwiftUI
import MapKit

struct MapTopControls: View {
    @EnvironmentObject var manager : Manager
    @Binding var position : MapCameraPosition
    @Binding var interactionMode : MapInteractionModes
    @Binding var mapKind : MapKind
    var body: some View {
        HStack(spacing:20) {
            Button(action: {manager.toggleFavorites()}) {
                Image(systemName: manager.isShowingFavorites ? "star.fill" : "star")
            }
            SearchButton()
            ZoomPlaceButton(position: $position)
            DiningButton()
            MapInteractionButton(interactionMode: $interactionMode)
            GeocodeButton().padding(.trailing)
            MapKindPicker(mapKind: $mapKind)
            Spacer()
            ClearButton()
        }
        .padding(.horizontal)
    }
}

#Preview {
    MapTopControls(position: .constant(.automatic), interactionMode: .constant(.all), mapKind: .constant(.UIKit))
        .environmentObject(Manager())
}
