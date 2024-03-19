//
//  CategoryView.swift
//  US States
//
//  Created by Nader Alfares on 3/19/24.
//

import SwiftUI

struct CategoryView: View {
    @Environment(StatesManager.self) var manager
    let category : Category
    var body: some View {
        @Bindable var manager = manager
        VStack {
            Text("\(category.title)")
            ScrollView(.horizontal) {
                HStack {
                    ForEach($manager.theStates) { $theState in
                        if category.property(theState) {
                            NavigationLink {
                                StateDetailView(theState: $theState, property: {category.property(theState)})
                            } label: {
                                Image(theState.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }

                            
                        }
                    }
                }
                
                
            }
        }
    }
}

//#Preview {
//    CategoryView()
//}
