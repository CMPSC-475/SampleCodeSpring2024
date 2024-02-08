//
//  ContentView.swift
//  BaseballCards
//
//  Created by Nader Alfares on 2/6/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var manager : Manager
    var body: some View {
        VStack {
            ZStack {
                ForEach($manager.cards) { $card in
                    BaseballCardView(card: $card)
                }
            }
            HStack {
                Score(title: "Traded", count: manager.tradedCount)
                Spacer()
                Button("Reset") {manager.reset()}
                Spacer()
                Score(title: "Kept", count: manager.keptCount)
            }
            .padding()
        }
    }
}

struct Score : View {
    var title : String
    var count : Int
    var body : some View {
        VStack {
            Text(title)
            Text("\(count)")
        }
    }
}

#Preview {
    RootView()
        .environmentObject(Manager())
}
