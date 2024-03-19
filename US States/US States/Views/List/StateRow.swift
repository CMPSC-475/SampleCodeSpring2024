//
//  StateRow.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import Foundation
import SwiftUI


struct StateRow: View {
    var theState : USState
    var body: some View {
        HStack {
            StateDetails(theState: theState)
            Spacer()
            //StateFlag(theState: theState)
            VStack {
                StateFeature(feature: theState.favorite, symbol: "star")
                StateFeature(feature: theState.visited, symbol: "car")
            }
        }
        .padding()
    }
}

struct StateDetails : View {
    @Environment(StatesManager.self) var manager
    var theState : USState
    var body : some View {
        VStack(alignment: .leading) {
            Text(theState.name).font(Font.title)
            //.scaledToFill()
                     //  .minimumScaleFactor(0.5)
               // .lineLimit(1)
            HStack(alignment: .center) {
                StateFlag(theState: theState)

                VStack(alignment:.leading) {
                    Text(theState.capital)
                    Text(manager.formatted(year:  theState.admissionYear))
                }
                .font(.subheadline)
                .minimumScaleFactor(0.4)
            }
        }
    }
}

struct StateFlag : View {
    var theState : USState
    var body : some View {
        Image(theState.name)
        .resizable()
        .scaledToFit()
        .frame(width: 50, height: 30, alignment: .center)
        //.aspectRatio(1.0, contentMode: .fill)
    }
}

struct StateFeature : View {
    var feature : Bool
    var symbol : String
    var body : some View {
        Image(systemName: feature ? "\(symbol).fill" : symbol)
            .renderingMode(.original)
    }
}


#Preview {
    StateRow(theState: USState.standard)
        .environment(StatesManager())
}
