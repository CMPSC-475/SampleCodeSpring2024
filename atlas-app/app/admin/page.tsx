"use client"
import { VStack, HStack, Text, useEditable } from "@chakra-ui/react"
import { useFlights } from "@/hooks/useFlights"
import { Flight } from "@/Models/Flight"
import { Input, Button } from "@chakra-ui/react"
import React, { useEffect } from "react"
import FlightsTable from "@/components/FlightsTable"
import { addFlight, getBookedFlights } from "../api/AtlasAPI"
import { BookedFlight } from "@/Models/Flight"



// admin page where user can add a flight
export default function Admin() {
    const {flights} = useFlights()

    const [bookedFlights, setBookedFlights] = React.useState<BookedFlight[]>([])

    useEffect(() => {
        //get booked flights
        getBookedFlights()
            .then((bookedFlights) => {
                setBookedFlights(bookedFlights)
            })
    }, [])

    return (
        <VStack>
            <FlightsTable flights={flights} />
            <AddFlightForm addFlight={addFlight}/>
            {
                bookedFlights.length > 0 && 
                <VStack>
                    <Text fontSize={"2xl"} fontWeight={"bold"} color={"black"}>
                        Booked Flights
                    </Text>
                    {
                        bookedFlights.map((bookedFlight) => {
                            return (
                                <HStack>
                                    <Text>{bookedFlight.flight_id} | </Text>
                                    <Text>{bookedFlight.passenger_email} | </Text>
                                    <Text>{bookedFlight.passenger_name}</Text>
                                </HStack>
                            )
                        })
                    }
                </VStack>
            }

        </VStack>
    )
}


export function AddFlightForm({addFlight} : {addFlight: (flight: Flight) => void}) {
    const [flight, setFlight] = React.useState<Flight>({
        id: 0,
        flight_id: '',
        origin: '',
        destination: '',
        departure: '',
        arrival: '',
        price: 0
    })

    return (
        <VStack>
            <Input placeholder="Flight Number" value={flight.flight_id} onChange={(e) => setFlight({...flight, flight_id: e.target.value})}/>
            <Input placeholder="Origin" value={flight.origin} onChange={(e) => setFlight({...flight, origin: e.target.value})}/>
            <Input placeholder="Destination" value={flight.destination} onChange={(e) => setFlight({...flight, destination: e.target.value})}/>
            <Input placeholder="Departure" value={flight.departure} onChange={(e) => setFlight({...flight, departure: e.target.value})}/>
            <Input placeholder="Arrival" value={flight.arrival} onChange={(e) => setFlight({...flight, arrival: e.target.value})}/>
            <Button onClick={() => addFlight(flight)}>Add Flight</Button>
        </VStack>
    )
}