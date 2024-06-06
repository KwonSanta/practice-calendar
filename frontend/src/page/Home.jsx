import { Box, Flex } from "@chakra-ui/react";
import { Navbar } from "../component/Navbar.jsx";
import { Sidebar } from "../component/Sidebar.jsx";
import { Outlet } from "react-router-dom";
import { Footer } from "../component/Footer.jsx";

export function Home() {
  return (
    <Flex direction={{ base: "column", lg: "row" }}>
      <Sidebar />
      <Box flex="1" p={4}>
        <Navbar />
        <Box mx={{
          base: 0,
          lg: 200,
        }} mt={10}>
          <Outlet />
        </Box>
        <Footer />
      </Box>
    </Flex>
  );
}