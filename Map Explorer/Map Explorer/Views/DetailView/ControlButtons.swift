//
//  ControlButtons.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI

struct ControlButtons: View {
    @EnvironmentObject var manager : Manager

    @Environment(\.dismiss) var dismiss

    var body: some View {
        HStack {
            Button(role: .destructive,
                   action:{dismiss()}) {
                Image(systemName: "trash")
            }
            Button(action:{dismiss()}) {
                Image(systemName: "arrow.up.square")
            }
            Button(action:{dismiss()}) {
                Image(systemName: "x.square")
            }
            .padding(.trailing)
        }
    }
}

#Preview {
    ControlButtons()
        .environmentObject(Manager())
}
