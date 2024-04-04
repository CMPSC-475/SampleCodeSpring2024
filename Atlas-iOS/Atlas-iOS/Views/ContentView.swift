//
//  ContentView.swift
//  Atlas-iOS
//
//  Created by Nader Alfares on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(AtlasManager.self) var manager
    @State var flights : [Flight] = []
    
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            VStack {
                Text("Flights")
                    .fontWeight(.bold)
                ScrollView {
                    ForEach(flights) { flight in
                        NavigationLink {
                            BookingView(flight: flight)
                        } label: {
                            FlightRow(flight: flight)
                        }
                    }
                }
            }
            .onAppear {
                //TODO: Fetch flights
            }
            .padding()
        }
        
    }
}

struct FlightRow : View {
    let flight : Flight
    var body : some View {
        VStack(alignment: .leading) {
            Text(flight.flight_id)
                .font(.title)
            HStack {
                Text(flight.origin)
                Spacer()
                Text(flight.destination)
            }
            HStack {
                Text(flight.departure)
                Spacer()
                Text(flight.arrival)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius:  25.0)
                .foregroundStyle(Color.cyan)
        )
        .foregroundStyle(.white)
        
    }
}

#Preview {
    ContentView()
        .environment(AtlasManager())
}
