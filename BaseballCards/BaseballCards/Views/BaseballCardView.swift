//
//  BaseballCardView.swift
//  BaseballCards
//
//  Created by Nader Alfares on 2/6/24.
//

import SwiftUI

struct BaseballCardView: View {
    @EnvironmentObject var manager : Manager

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BaseballCardView()
        .environmentObject(Manager())
}
