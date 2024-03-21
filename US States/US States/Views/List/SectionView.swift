//
//  SectionView.swift
//  US States
//
//  Created by Nader Alfares on 3/21/24.
//

import SwiftUI

struct SectionView<Content>: View where Content : View {
    @Environment(StatesManager.self) var manager
    @AppStorage(Storage.homeStateId) var homeStateId : String?

    let sectionInfo: SectionInfo
    let hasDivider: Bool
    let content : (USState) -> Content

    var body: some View {
        @Bindable var manager = manager
        
        Section {
            ForEach($manager.theStates) {$aState in
                if sectionInfo.identifiers.contains(aState.id) {
                    NavigationLink(destination: StateDetailView(theState:$aState, property: {true})) {
                        content(aState)
                    }
                }
            }
        } header: {
            Text(sectionInfo.title)
        } footer: {
            Capsule()
                .frame(height:5)
                .padding()
                .opacity(hasDivider ? 1 : 0)
        }
    }
}

#Preview {
    SectionView( sectionInfo: SectionInfo(title: "Any State", identifiers: Set(["Maine","Ohio","Iowa","Utah"])),
                 hasDivider: true,
                 content: {StateCardView(theState: $0)} )
        .environment(StatesManager())
}
