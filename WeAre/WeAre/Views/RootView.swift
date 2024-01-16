//
//  ContentView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/11/24.
//

import SwiftUI

struct RootView: View {
    @StateObject var cheerManager : CheerManager = CheerManager()
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack {
                MascotView(imageName: "Mascot 0")
                    
                CheerTextView(title: "We Are", isVisible: cheerManager.isFirstCheerVisisble)
                    
                CheerTextView(title: "Penn State", isVisible: cheerManager.isSecondCheerVisible)

                Button("Cheer") {
                    cheerManager.cheer()
                }
                .tint(.red)
                .buttonStyle(.borderedProminent)
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
            .opacity(isVisible ? 1 : 0)
    }
}




#Preview {
    RootView()
}
