//
//  sample.swift
//  WeAre
//
//  Created by Nader Alfares on 1/21/24.
//

import SwiftUI

import SwiftUI

struct WordsList: View {
    let wordsCreated: [String]
    var body: some View {
        ZStack{
            Color.cyan
            ScrollView(.horizontal){
                
                HStack{
                    ForEach(wordsCreated, id: \.self) { word in
                        Text("\(word)")
                        Spacer()
                    }
                    
                }
                .padding()
                .bold()
                .font(.title2)
                .textCase(.lowercase)
            }
            
        }
        .frame(height: 60)
    }
}

#Preview {
    WordsList(wordsCreated: ["hello", "world", "afasfsafsafafsadfsaf", "afsdfsafsafasfsafsda", "asdfsdfsafasf"])
}
