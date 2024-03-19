//
//  DetailHeader.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct DetailHeader: View {
    @Environment(StatesManager.self) var manager
    @AppStorage(Storage.homeStateId) var homeStateId: String?
    @Binding var theState : USState
    
    let property : () -> Bool
    
    var isFilled : Bool {
        homeStateId == theState.id
    }

    var body : some View {
        HStack(alignment: .center) {
            Text("Founded: \(manager.formatted(year: theState.admissionYear))")
            Button {
                homeStateId = theState.id
            } label: {
                Image(systemName: isFilled ? "house.fill" : "house")
            }

            Spacer()
            FeatureButton(value: $theState.visited, iconName: Icons.visited, property: property )
            FeatureButton(value: $theState.favorite, iconName: Icons.favorite, property: property)
        }
    }
}

//#Preview {
//    DetailHeader(theState: .constant(USState.standard))
//        .environment(StatesManager())
//}
