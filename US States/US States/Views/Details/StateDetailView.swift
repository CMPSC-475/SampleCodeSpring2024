//
//  StateDetailView.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct StateDetailView: View {
    @Binding var theState : USState
    let property : () -> Bool
    var body: some View {

            ScrollView {
                VStack {
                    Group {
                        DetailHeader(theState: $theState, property: property)
                        if let bird = theState.stateBird {
                            DetailBird(birdName: bird)
                        }
                        Text(theState.info)
                        DetailImages(imageNames: theState.images)

                    }.padding()
                }
        }
        .navigationTitle(Text(theState.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    StateDetailView(theState: .constant(USState.standard))
//}
