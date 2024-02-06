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
            
            HStack {
                Score(title: "Traded", count: 0)
                Spacer()
                Button("Reset") {}
                Spacer()
                Score(title: "Kept", count: 0)
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
