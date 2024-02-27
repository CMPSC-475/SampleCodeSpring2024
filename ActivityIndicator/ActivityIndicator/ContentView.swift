//
//  ContentView.swift
//  ActivityIndicator
//
//  Created by Nader Alfares on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating : Bool = false
    var body: some View {
        VStack {

            ActivityIndicator(isAnimating: $isAnimating)
            Button("press me") {
                isAnimating.toggle()
            }
        }
        .padding()
    }
}


struct ActivityIndicator : UIViewRepresentable {
    @Binding var isAnimating : Bool
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let uiView = UIActivityIndicatorView(style: .large)
        return uiView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}




#Preview {
    ContentView()
}
