//
//  MapInteractionButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import SwiftUI

struct MapInteractionButton: View {

    var body: some View {
        Button(action:{
            // update interaction mode
        }) {
            Image(systemName: true ? "hand.draw" : "hand.draw.fill")
        }
    }
}

#Preview {
    MapInteractionButton()
}
