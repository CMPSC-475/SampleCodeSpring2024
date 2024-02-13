//
//  PlaceDetailView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI

struct PlaceDetailView: View {
    @EnvironmentObject var manager : Manager
    var place : Favorite
    var body: some View {
        
            VStack(alignment:.leading) {
                HStack(alignment: .top) {
                    VStack(alignment:.leading) {
                        Text(place.title).font(.title)
                        HStack {
                            Text("Point of Interest")
                            Text("·")
                            Text("Other Info")
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

