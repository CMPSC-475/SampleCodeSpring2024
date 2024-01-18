//
//  ContentView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/11/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var cheerManager : CheerManager
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack {
                MascotView(imageName: cheerManager.currentCheer.imageName)
                CheerTextView(title: cheerManager.currentCheer.title, isVisible: cheerManager.isFirstCheerVisisble)
                CheerTextView(title: cheerManager.currentCheer.title, isVisible: cheerManager.isSecondCheerVisible)
                CheerButtonView()

            }
            .font(.title)
        }
    }
}

struct CheerTextView : View {
    let title : String
    var isVisible : Bool
    var body : some View {
        Text(title)
            .opacity(isVisible ? 1.0 : 0.0)
    }
}




#Preview {
    RootView()
        .environmentObject(CheerManager())
}
