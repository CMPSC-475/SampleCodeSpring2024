"use client"
import Image from "next/image";
import styles from "./page.module.css";
import { HStack, VStack, Text } from "@chakra-ui/react";
import FlightsTable from "@/components/FlightsTable";
import AtlasLogo from "@/public/atlas_logo.png";
import Navbar from "@/components/Navbar"
import { useFlights } from "@/hooks/useFlights";

export default function Home() {

  const {flights} = useFlights()


  return (
    <VStack backgroundColor={"blue.100"} spacing={0}>
      <Navbar />
      <VStack bgGradient="linear(to-t, black, blue.300)" height={"100vh"} width={"100%"} justify={"center"} align={"center"}>
        <Image src={AtlasLogo.src} alt="Atlas Logo" width={200} height={200} />
        <Text fontSize={"4xl"} fontWeight={"bold"} color={"white"}>
          Welcome to Atlas
        </Text>
      </VStack>


      <VStack>
        <Text fontSize={"2xl"} fontWeight={"bold"} color={"black"}>
          Book your flight today
        </Text>
      <FlightsTable flights={flights}/>
      </VStack>
    </VStack>
  );
}
