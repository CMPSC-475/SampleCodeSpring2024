//
//  PreferenceView.swift
//  Color Components
//
//  Created by Nader Alfares on 1/29/24.
//

import SwiftUI


struct PreferenceView: View {
    @Binding var preferences : Preferences
    @Environment(\.dismiss) var dismiss  // simple way for dismissing a modal view
    var body: some View {
        Form {
            Section("Color Shapes") {
                Picker("Choose", selection: $preferences.colorShape) {
                    ForEach(ColorShape.allCases) {
                        Text($0.rawValue.capitalized).tag($0)
                    }
                }.pickerStyle(.segmented)
            }
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}


//#Preview {
//    PreferenceView()
//}
