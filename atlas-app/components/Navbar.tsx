import { Box, Button, HStack, Spacer, Text } from '@chakra-ui/react'
import { useRouter } from 'next/navigation'
import { Link } from '@chakra-ui/react'

// component that displays the navbar using chakra ui
export default function Navbar() {

    const router = useRouter()
    const handleButtonClick = () => {
        router.push('/flights')
    }
    return (
        <HStack pt={2} px={2} background={"black"} w={"100vw"} color={"white"}>
            <Text fontSize='2xl'>Atlas</Text>
            <Spacer />
            <Link onClick={handleButtonClick}>Flights</Link>
        </HStack>
    )
}