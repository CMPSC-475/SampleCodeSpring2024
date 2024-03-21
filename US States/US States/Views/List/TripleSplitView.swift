//
//  TripleSplitView.swift
//  US States
//
//  Created by Nader Alfares on 3/21/24.
//

import SwiftUI

struct TripleSplitView: View {
    @Environment(StatesManager.self) var manager
    
    
    @State var sectionInfo : SectionInfo?
    @State var stateId : String?
    
    var body: some View {
        @Bindable var manager = manager
        NavigationSplitView {
            List(manager.sectionInfo(for: .byDecade), selection: $sectionInfo) { sectionInfo in
                Text(sectionInfo.title)
                    .tag(sectionInfo)
            }
        } content: {
            if let sectionInfo {
                List(selection: $stateId) {
                    ForEach($manager.theStates) { $aState in
                        if sectionInfo.identifiers.contains(aState.id) {
                            StateRow(theState: aState)
                        }
                    }
                }
            } else {
                Text("Select a decade")
            }
        } detail: {
            if let stateId {
                if let index = manager.indexFor(id: stateId) {
                    StateDetailView(theState: $manager.theStates[index], property: {true})
                }
            }
        }

    }
}

#Preview {
    TripleSplitView()
        .environment(StatesManager())
}
