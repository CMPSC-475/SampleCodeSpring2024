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

    var body: some View {
        HStack(spacing:20) {
            Button(action: {manager.toggleFavorites()}) {
                Image(systemName: manager.isShowingFavorites ? "star.fill" : "star")
            }
            SearchButton()
            ZoomPlaceButton(position: $position)
            DiningButton()
            MapInteractionButton()
            GeocodeButton().padding(.trailing)
            Spacer()
            ClearButton()
        }
        .padding(.horizontal)
    }
}

#Preview {
    MapTopControls(position: .constant(.automatic))
        .environmentObject(Manager())
}
