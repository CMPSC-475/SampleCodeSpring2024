//
//  SearchButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/15/24.
//

import SwiftUI

struct SearchButton: View {
    @EnvironmentObject var manager : Manager
    var body: some View {
        Menu("Categories") {
            ForEach(Category.allCases, id:\.self) { category in
                Button {
                    manager.searchFor(category)
                } label: {
                    Text(category.rawValue.capitalized)
                }

            }
        }
    }
}

#Preview {
    SearchButton()
        .environmentObject(Manager())
}
