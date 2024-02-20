//
//  ContentView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI
import MapKit


struct MainView: View {
    @EnvironmentObject var manager : Manager
    
    @State private var selectedPlace : Place?

    var body: some View {
        
        DowntownMap(selectedPlace: $selectedPlace)
            .sheet(item: $selectedPlace) { selectedPlace in
            PlaceDetailView(place: selectedPlace)
                .presentationDetents([.fraction(0.3)])
            }
            .alert("User's Location", isPresented: $manager.showAlert, actions: {}) {
                Text(manager.userLocationDescription ?? "No Location Found")
            }

    }
}




#Preview {
    MainView()
        .environmentObject(Manager())

}
