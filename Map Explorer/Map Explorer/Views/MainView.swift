//
//  ContentView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let stateCollege = CLLocationCoordinate2D(latitude: 40.79550030, longitude: -77.85900170)
}

struct MainView: View {
    @EnvironmentObject var manager : Manager

    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Map(initialPosition: .item(MKMapItem(placemark: MKPlacemark(coordinate: .stateCollege))))
    }
}

#Preview {
    MainView()
        .environmentObject(Manager())

}
