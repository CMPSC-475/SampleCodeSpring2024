//
//  FeatureButton.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct FeatureButton: View {
    @Binding var value : Bool
    let iconName : String
    
    var body: some View {
        Button(action:{value.toggle()}) {
            Image(systemName: value ? iconName+".fill" : iconName)
        }
    }
}

#Preview {
    FeatureButton(value: .constant(true), iconName: "car")
}
