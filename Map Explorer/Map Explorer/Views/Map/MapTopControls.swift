//
//  MapTopControls.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/15/24.
//

import SwiftUI

struct MapTopControls: View {
    @EnvironmentObject var manager : Manager

    var body: some View {
        HStack(spacing:20) {
            Button(action: {manager.toggleFavorites()}) {
                Image(systemName: manager.isShowingFavorites ? "star.fill" : "star")
            }
            SearchButton()
            ZoomPlaceButton()
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
    MapTopControls()
        .environmentObject(Manager())
}
