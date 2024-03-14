//
//  ContentView.swift
//  US States
//
//  Created by Nader Alfares on 3/11/24.
//

import SwiftUI

struct StatesList: View {
    @Environment(StatesManager.self) var manager
    @AppStorage("sectioning") var sectioning : Sectioning = .none
    
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            List {
                ForEach(manager.sectionInfo(for: sectioning)) {sectionInfo in
                    Section {
                        ForEach($manager.theStates) { $aState in
                            if(sectionInfo.identifiers.contains(aState.id)) {
                                NavigationLink(destination: StateDetailView(theState: $aState)) {
                                    StateRow(theState: aState)
                                }
                            }
                        }
                        
                    } header : {
                        Text(sectionInfo.title)
                    }
                    
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
