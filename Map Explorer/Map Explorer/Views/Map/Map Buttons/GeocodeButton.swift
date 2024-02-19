//
//  GeocodeButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import SwiftUI

struct GeocodeButton: View {
    @EnvironmentObject var manager : Manager

    var body: some View {
        //TODO: add action for reverse geocoding user's location
        Button(action:{}){
            Image(systemName: "location.magnifyingglass")
        }
    }
}

#Preview {
    GeocodeButton()
        .environmentObject(Manager())
}
