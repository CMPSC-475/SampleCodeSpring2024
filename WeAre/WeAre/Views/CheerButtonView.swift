//
//  CheerButtonView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/18/24.
//

import SwiftUI

struct CheerButtonView: View {
    @EnvironmentObject var cheerManager : CheerManager
    var body: some View {
        Button("Cheer") {
            cheerManager.cheer()
        }
        .tint(.red)
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    CheerButtonView()
        .environmentObject(CheerManager())
}
