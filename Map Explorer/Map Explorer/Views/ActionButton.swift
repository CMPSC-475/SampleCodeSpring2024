//
//  ActionButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import SwiftUI

struct ActionButton: View {
    let title:String
    let icon: String
    let action : () -> Void
    
    private let width = 60.0
    private let height = 40.0
    var body : some View {
        Button(action: action) {
            VStack {
                Image(systemName: icon)
                Text(title)
            }.frame(width:width,height:height)
        }.buttonStyle(.borderedProminent)
            
    }
}

#Preview {
    ActionButton(title: "Phone", icon: "phone", action: {})
}

