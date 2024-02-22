//
//  ButtonRowView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI

struct ButtonRow: View {
    @EnvironmentObject var manager : Manager
    @Environment(\.dismiss) var dismiss

    let place : Place
    var body: some View {
        HStack {
            ActionButton(title: "Route", icon: "figure.walk", action:
                            {
                manager.provideDirections(for: place)
                dismiss()
            })
            ActionButton(title: "Call", icon: "phone", action: {})
            ActionButton(title: "Website", icon: "safari", action: {})
            ActionButton(title: "More", icon: "ellipsis", action: {})
        }.font(.subheadline)
    }
}

#Preview {
    ButtonRow(place: Place.standard)
        .environmentObject(Manager())
}
