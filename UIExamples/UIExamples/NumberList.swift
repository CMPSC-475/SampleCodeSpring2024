//
//  NumberList.swift
//  UIExamples
//
//  Created by Nader Alfares on 1/9/24.
//

import SwiftUI

struct NumberList: View {
    let maxNumber : Int
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<maxNumber, id:\.self) {n in
                    Text("\(n)")
                        .font(.title)
                }
            }
        }
    }
}

struct NumberList_Previews: PreviewProvider {
    static var previews: some View {
        NumberList(maxNumber: 500)
        
    }
}
