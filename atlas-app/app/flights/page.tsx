"use client"
import {
    Table,
    Thead,
    Tbody,
    Tfoot,
    Tr,
    Th,
    Td,
    TableCaption,
    TableContainer,
  } from '@chakra-ui/react'

  import { VStack, Button } from '@chakra-ui/react'

  import { Flight } from '../../Models/Flight'
import { use } from 'react'

import { useFlights } from '../../hooks/useFlights'
import FlightsTable from '../../components/FlightsTable'


interface FlightsProps {
    flights: Flight[]
}




export default function Flights (props : FlightsProps) {

    const {flights} = useFlights()


    return (
        <FlightsTable flights={flights}/>
    )
}