//
//  GridView.swift
//  US States
//
//  Created by Nader Alfares on 3/21/24.
//

import SwiftUI

struct GridView: View {
    @Environment(StatesManager.self) var manager
    
    let columns = [GridItem(.adaptive(minimum: Flag.height * 2))]
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(manager.sectionInfo(for: .byDecade)) { sectionInfo in
                        SectionView(sectionInfo: sectionInfo, hasDivider:true) {StateCardView(theState: $0)}
                    }
                })
                
            }
            
        }
    }
}

#Preview {
    GridView()
        .environment(StatesManager())
}
