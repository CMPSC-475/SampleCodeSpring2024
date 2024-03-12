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
                ForEach($manager.theStates) {
                    $aState in
                    NavigationLink(destination: StateDetailView(aState: $aState)) {
                        StateRow(aState: $aState)
                    }
                    
                }
                
            }
        }
    }
}


struct StateRow : View {
    @Binding var aState : USState
    var body : some View {
        Text("\(aState.name)")
            .foregroundStyle(Color("psu"))
        Button(action: {aState.favorite.toggle()}) {
            Image(systemName: aState.favorite ? "star.fill" : "star")
        }
        
    }
}


struct StateDetailView : View {
    @Binding var aState : USState
    var body : some View {
        Text("\(aState.name)")
            .foregroundStyle(Color("psu"))
        Button(action: {aState.favorite.toggle()}) {
            Image(systemName: aState.favorite ? "star.fill" : "star")
        }
        
        
    }
}

#Preview {
    StatesList()
        .environment(StatesManager())
}
