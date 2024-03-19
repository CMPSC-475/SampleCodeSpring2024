//
//  ContentView.swift
//  US States
//
//  Created by Nader Alfares on 3/11/24.
//

import SwiftUI

struct StatesList: View {
    @Environment(StatesManager.self) var manager
    @AppStorage(Storage.sectioning) var sectioning : Sectioning = .none
    @AppStorage(Storage.homeStateId) var homeStateId : String?
    
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            
            if homeStateId != nil {
                let index = manager.indexFor(id: homeStateId!)!
                HomeStateView(theState: manager.theStates[index])
            }
            
            List {
                ForEach(manager.sectionInfo(for: sectioning)) {sectionInfo in
                    Section {
                        ForEach($manager.theStates) { $aState in
                            if(sectionInfo.identifiers.contains(aState.id)) {
                                NavigationLink(destination: StateDetailView(theState: $aState, property: {sectionInfo.identifiers.contains(aState.id)})) {
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
