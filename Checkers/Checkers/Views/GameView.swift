//
//  GameView.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import Foundation
import SwiftUI

struct GameView: View {
    @EnvironmentObject var manager:GameManager
    @State var showPreference = false
    var body: some View {
        VStack {
            
            ControlView(showPreference: $showPreference)
            Spacer()
            ZStack(alignment: .topLeading) {
                BoardView()
                ForEach($manager.pieces) { $piece in
                        CheckerView(piece: $piece)
                }
            }
            Spacer()
        }
        .sheet(isPresented: $showPreference) {
            PreferenceView(preferences: $manager.preferences)
        }
    }
}

#Preview {
    GameView()
        .environmentObject(GameManager())
}
