//
//  HomeStateView.swift
//  US States
//
//  Created by Nader Alfares on 3/19/24.
//

import SwiftUI

struct HomeStateView: View {
    let theState : USState
    var imageName : String {
        theState.images.isEmpty ? theState.name : theState.images[0]
    }
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    HomeStateView(theState: USState.standard)
}
