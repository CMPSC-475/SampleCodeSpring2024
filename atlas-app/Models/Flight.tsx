

export interface Flight {
    id: number
    flight_id: string
    origin: string
    destination: string
    departure: string
    arrival: string
    price: number
}

export interface BookedFlight {
    flight_id: number, 
    passenger_name: string,
    passenger_email: string
}