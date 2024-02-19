//
//  ZoomPlaceButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import SwiftUI

struct ZoomPlaceButton: View {
    @EnvironmentObject var manager : Manager
    var body: some View {
        Menu {
            Text("Todo: populate with result places")
        } label: {
            Image(systemName: "mappin")
        }
    }
}

#Preview {
    ZoomPlaceButton()
        .environmentObject(Manager())
}
