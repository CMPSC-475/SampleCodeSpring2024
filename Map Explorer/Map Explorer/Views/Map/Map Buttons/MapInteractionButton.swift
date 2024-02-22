//
//  MapInteractionButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import SwiftUI
import MapKit

struct MapInteractionButton: View {
    @Binding var interactionMode : MapInteractionModes
    var body: some View {
        Button(action:{
            // update interaction mode
            interactionMode = interactionMode == .all ? .zoom : .all
        }) {
            Image(systemName: interactionMode == .all ? "hand.draw.fill" : "hand.draw")
        }
    }
}

#Preview {
    MapInteractionButton(interactionMode: .constant(.all))
}
