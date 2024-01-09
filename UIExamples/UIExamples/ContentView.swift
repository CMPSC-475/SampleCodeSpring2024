//
//  ContentView.swift
//  UIExamples
//
//  Created by Nader Alfares on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    var listOfThings : [String] = ["Do Assignment 0", "Go for a run"]
    var body: some View {
        return VStack {
            ForEach(listOfThings, id:\.self) { t in
                TaskView(task: t)
            }
        }
        .padding()
    }
}

struct TaskView : View {
    var task: String
    var body : some View {
        ZStack {
            Color.orange
            HStack {
                Circle()
                    .frame(width: 50)
                    .foregroundStyle(.green)
                Text("\(task)")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(.blue)
                    )
                
            }
        }
    }
    
}

#Preview {
    ContentView()
}
