//
//  SectionPicker.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct SectionPicker: View {

    @Environment(StatesManager.self) var manager
    @AppStorage("sectioning") var sectioning : Sectioning = .none
    
    var body: some View {
        @Bindable var manager = manager
        Picker("Sectioning", selection: $sectioning) {
            ForEach(Sectioning.allCases, id:\.self) {
                Text($0.rawValue)
                    .tag($0)
            }
        }
    }
}

#Preview {
    SectionPicker()
        .environment(StatesManager())
}
