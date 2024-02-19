//
//  ClearButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/19/24.
//

import SwiftUI

struct ClearButton: View {
    
    @EnvironmentObject var manager : Manager
    
    var body: some View {
        Button(action: {manager.clearAll()}) {
            Image(systemName: "clear")
        }
    }
}

#Preview {
    ClearButton()
        .environmentObject(Manager())
}
