import { Flight } from "@/Models/Flight"
import { Table, Thead, Tbody, Tr, Th, Td } from "@chakra-ui/react"

// component that displays the flights table
interface FlightsTableProps {
    flights: Flight[]
}


export default function FlightsTable({flights}: FlightsTableProps) {
    return (
        <Table variant='simple'>
            <Thead>
                <Tr>
                    <Th>Flight Number</Th>
                    <Th>Departure </Th>
                    <Th>Origin </Th>
                    <Th>Destination </Th>
                    <Th>Arrival</Th>
                </Tr>
            </Thead>
            <Tbody>
                {
                    flights.map(f => (
                        <Tr key={f.id}>
                            <Td>{f.name}</Td>
                            <Td>{f.departure}</Td>
                            <Td>{f.origin}</Td>
                            <Td>{f.destination}</Td>
                            <Td>{f.arrival}</Td>
                        </Tr>
                    ))
                }
            </Tbody>
        </Table>
    )
}



