//
//  DetailHeader.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct DetailHeader: View {
    @Environment(StatesManager.self) var manager
    @Binding var theState : USState

    var body : some View {
        HStack(alignment: .center) {
            Text("Founded: \(manager.formatted(year: theState.admissionYear))")
            Spacer()
            FeatureButton(value: $theState.visited, iconName: "car")
            FeatureButton(value: $theState.favorite, iconName: "star")
        }
    }
}

#Preview {
    DetailHeader(theState: .constant(USState.standard))
        .environment(StatesManager())
}
