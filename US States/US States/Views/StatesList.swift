//
//  ContentView.swift
//  US States
//
//  Created by Nader Alfares on 3/11/24.
//

import SwiftUI

struct StatesList: View {
    @Environment(StatesManager.self) var manager
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            List {
                ForEach($manager.theStates) {$aState in
                    NavigationLink(destination: StateDetailView(theState:$aState)) {  StateRow(theState: $aState) }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    SectionPicker()
                }
            }
        }
    }
}


#Preview {
    StatesList()
        .environment(StatesManager())
}
