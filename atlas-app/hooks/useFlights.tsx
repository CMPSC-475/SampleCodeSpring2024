"use client"
import { Flight } from "@/Models/Flight";
import { createContext, useContext, useState, ReactNode, useEffect } from "react";
import { setFlagsFromString } from "v8";


interface FlightsContextType {
    flights : Flight[]
    addFlight: (flight: Flight) => void
    bookFlight: (flight:Flight) => void
}

const FlightsContext = createContext<FlightsContextType | undefined>(undefined)

export function FlightsProvider({children} : {children : ReactNode}) {
    const [flights, setFlights] = useState<Flight[]>([]);

    useEffect(() => {
        //TODO: Invoke API for flights

        if (typeof window !== 'undefined') {
            let flightsData = localStorage.getItem('flights')
            if (flightsData) {
                setFlights(JSON.parse(flightsData))
            }
        }
    }, [])


    function addFlight (flight: Flight) {
        let newFlights = [...flights, flight]
        setFlights(newFlights)
        if (typeof window !== 'undefined') {
            localStorage.setItem('flights', JSON.stringify(newFlights))
        }
    } 
    
    function bookFlight (flight:Flight) {
        let newFlights = flights.filter(f => f.id !== flight.id)
        setFlights(newFlights)
        if (typeof window !== 'undefined') {
            localStorage.setItem('flights', JSON.stringify(newFlights))
        }
    }

    return (
        <FlightsContext.Provider value={{flights, addFlight, bookFlight}}>
            {children}
        </FlightsContext.Provider>
    )
}


export function useFlights() {
    const context = useContext(FlightsContext)
    if (context === undefined) {
        throw new Error('useFlights must be used within a flights provider')
    }
    return context
}


