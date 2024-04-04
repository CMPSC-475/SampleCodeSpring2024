//
//  BookingView.swift
//  Atlas-iOS
//
//  Created by Nader Alfares on 4/4/24.
//

import SwiftUI

struct BookingView: View {
    @Environment(AtlasManager.self) var manager
    let flight : Flight
    @State var passengerName : String = ""
    @State var passengerEmail : String = ""
    var body: some View {
        @Bindable var manager = manager
        VStack {
            FlightRow(flight: flight)
            TextField("name", text: $passengerName)
            TextField("email", text: $passengerEmail)
            Button {
                manager.bookFlight(booking: BookFlight(flight_id: flight.id, passengerName: passengerName, passegnerEmail: passengerEmail))
            } label: {
                Text("Book Flight")
            }
            .alert(manager.alertMessage, isPresented: $manager.showAlert) {
            }

        }
        .padding()
    }
}

#Preview {
    BookingView(flight: Flight.standard)
        .environment(AtlasManager())
}
