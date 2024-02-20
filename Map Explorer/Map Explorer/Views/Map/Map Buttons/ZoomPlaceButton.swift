//
//  ZoomPlaceButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import SwiftUI
import MapKit

struct ZoomPlaceButton: View {
    @EnvironmentObject var manager : Manager
    @Binding var position : MapCameraPosition
    var body: some View {
        Menu {
            ForEach(manager.places, id:\.self) { place in
                Button {
                    position = .item(place.mapItem)
                } label: {
                    Text(place.name)
                }

            }
        } label: {
            Image(systemName: "mappin")
        }
    }
}

#Preview {
    ZoomPlaceButton(position: .constant(.automatic))
        .environmentObject(Manager())
}
