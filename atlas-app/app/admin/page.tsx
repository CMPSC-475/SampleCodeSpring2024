"use client"
import { VStack, Text } from "@chakra-ui/react"
import { useFlights } from "@/hooks/useFlights"
import { Flight } from "@/Models/Flight"
import { Input, Button } from "@chakra-ui/react"
import React from "react"
import FlightsTable from "@/components/FlightsTable"



// admin page where user can add a flight
export default function Admin() {
    const {flights, addFlight} = useFlights()

    return (
        <VStack>
            <FlightsTable flights={flights} />
            <AddFlightForm addFlight={addFlight}/>

        </VStack>
    )
}


export function AddFlightForm({addFlight} : {addFlight: (flight: Flight) => void}) {
    const [flight, setFlight] = React.useState<Flight>({
        id: 0,
        name: '',
        origin: '',
        destination: '',
        departure: '',
        arrival: ''
    })

    return (
        <VStack>
            <Input placeholder="Flight Number" value={flight.name} onChange={(e) => setFlight({...flight, name: e.target.value})}/>
            <Input placeholder="Origin" value={flight.origin} onChange={(e) => setFlight({...flight, origin: e.target.value})}/>
            <Input placeholder="Destination" value={flight.destination} onChange={(e) => setFlight({...flight, destination: e.target.value})}/>
            <Input placeholder="Departure" value={flight.departure} onChange={(e) => setFlight({...flight, departure: e.target.value})}/>
            <Input placeholder="Arrival" value={flight.arrival} onChange={(e) => setFlight({...flight, arrival: e.target.value})}/>
            <Button onClick={() => addFlight(flight)}>Add Flight</Button>
        </VStack>
    )
}