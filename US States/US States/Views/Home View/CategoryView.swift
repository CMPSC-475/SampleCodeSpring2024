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
            HStack {
                Text("\(category.title)")
                    .bold()
                    .font(.title2)
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach($manager.theStates) { $theState in
                        if category.property(theState) {
                            NavigationLink {
                                StateDetailView(theState: $theState, property: {category.property(theState)})
                            } label: {
                                StateCardView(theState: theState)
                            }

                            
                        }
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    CategoryView(category: Category(title: "All States", property: {_ in true}))
        .environment(StatesManager())
}
