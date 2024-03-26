"use client"
import Image from "next/image";
import styles from "./page.module.css";

import { HStack, VStack, Text } from "@chakra-ui/react";

export default function Home() {
  return (
    <VStack backgroundColor={"blue.100"} height={"100vh"}>
      <Text fontSize={"4xl"} fontWeight={"bold"}>
        Welcome to Atlas
      </Text>
    </VStack>
  );
}
