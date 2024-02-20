//
//  PlaceDetailView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI

struct PlaceDetailView: View {
    @EnvironmentObject var manager : Manager
    var place : Place
    var body: some View {
        
            VStack(alignment:.leading) {
                HStack(alignment: .top) {
                    VStack(alignment:.leading) {
                        Text(place.name).font(.title)
                        HStack {
                            Text(manager.poiCategoryStringFrom(place.mapItem.pointOfInterestCategory))
                            Text("·")
                            Text(manager.infoFrom(place.mapItem.placemark))
                        }
                        
                    }.padding([.bottom,.leading])
                    Spacer()
                    ControlButtons()
                }
                ButtonRow()
                    .padding()
            }
    }
}

//#Preview {
//    PlaceDetailView()
//        .environmentObject(Manager())
//}

