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


interface FlightsProps {
    flights: Flight[]
}

interface Flight {
    id: number
    name: string
    origin: string
    destination: string
    departure: string
    arrival: string
}


export default function Flights (props : FlightsProps) {

    const mockData = [
        {
            id: 1,
            name: 'NL1234',
            origin: 'JFK',
            destination: 'LAX',
            departure: '10:00',
            arrival: '13:00'
        },
        {
            id: 2,
            name: 'NL1234',
            origin: 'LAX',
            destination: 'JFK',
            departure: '14:00',
            arrival: '17:00'
        }
    ]


    return (

        <VStack>
        <TableContainer>
            <Table variant='simple'>
                <TableCaption>{Date().toString()}</TableCaption>
                <Thead>
                <Tr>
                    <Th>Flight Number</Th>
                    <Th>Departure </Th>
                    <Th>Origin </Th>
                    <Th>Destination </Th>
                    <Th>Arrival</Th>
                    <Th></Th>
                </Tr>
                </Thead>
                <Tbody>

                {
                    mockData.map((flight) => (
                        <Tr key={flight.id}>
                            <Td>{flight.name}</Td>
                            <Td>{flight.departure}</Td>
                            <Td>{flight.origin}</Td>
                            <Td>{flight.destination}</Td>
                            <Td>{flight.arrival}</Td>
                            <Td> <Button> BOOK</Button></Td>
                        </Tr>
                    ))
                }
                </Tbody>
                <Tfoot>
                <Tr>
                    <Th>Flight Number</Th>
                    <Th>Departure </Th>
                    <Th>Origin </Th>
                    <Th>Destination </Th>
                    <Th>Arrival</Th>
                </Tr>
                </Tfoot>
            </Table>
            </TableContainer>
        </VStack>
    )
}