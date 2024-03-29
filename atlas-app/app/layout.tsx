import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { ChakraProvider } from '@chakra-ui/react'
import { FlightsProvider } from "@/hooks/useFlights";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={inter.className}>
      <FlightsProvider>
      <ChakraProvider>
      {children}
      </ChakraProvider>
      </FlightsProvider>
        </body>
    </html>
  );
}
