//
//  EasySplitView.swift
//  US States
//
//  Created by Nader Alfares on 3/21/24.
//

import SwiftUI

struct EasySplitView: View {
    var body: some View {
        NavigationSplitView {
            StatesList()
        } detail: {
            Text("Select a State")
        }

    }
}

#Preview {
    EasySplitView()
        .environment(StatesManager())
}
