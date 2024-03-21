//
//  RootView.swift
//  US States
//
//  Created by Nader Alfares on 3/21/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                
            
            StatesList()
                .tabItem {
                    Label("List", systemImage: "list.star")
                }
            
            TripleSplitView()
                .tabItem {
                    Label("SplitView", systemImage: "rectangle.split.3x1.fill")
                }
            
            GridView()
                .tabItem {
                    Label("Grid", systemImage: "square.grid.2x2.fill")
                }
            
            
        }
    }
}

#Preview {
    RootView()
        .environment(StatesManager())
}
