//
//  PreferenceView.swift
//  Checkers
//
//  Created by Nader Alfares on 1/31/24.
//

import Foundation
import SwiftUI

struct PreferenceView: View {
    @Binding var preferences : Preferences
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Board Size") {
                Picker("Choose", selection: $preferences.boardDimension) {
                    ForEach(preferences.boardRange, id:\.self) {
                        Text("\($0)")
                    }
                }.pickerStyle(.segmented)
            }
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

#Preview {
    PreferenceView(preferences: .constant(Preferences()))
}
