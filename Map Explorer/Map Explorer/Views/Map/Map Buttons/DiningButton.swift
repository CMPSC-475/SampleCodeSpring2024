//
//  DiningButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import SwiftUI

struct DiningButton: View {
    @EnvironmentObject var manager : Manager
    
    var body: some View {
        Menu {
            ForEach(Restaurant.restaurants) {resturant in
                Button {
                    manager.geocodeFor(resturant)
                } label: {
                    Text(resturant.name)
                }

            }
        } label: {
            Image(systemName: "fork.knife")
        }
    }
}

#Preview {
    DiningButton()
        .environmentObject(Manager())
}
