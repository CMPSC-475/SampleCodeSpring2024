//
//  ControlView.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import SwiftUI

struct ControlView: View {
    @EnvironmentObject var manager : GameManager
    @Binding var showPreference : Bool
    var body: some View {
        HStack {
            Button(action: {withAnimation{manager.resetGame()}}) {
                Image(systemName: "arrow.triangle.2.circlepath")
            }
            Spacer()
            Button(action: {showPreference = true}) {
                Image(systemName: "gear")
            }
            .padding()
        }
    }
}

#Preview {
    ControlView(showPreference: .constant(false))
        .environmentObject(GameManager())
}
