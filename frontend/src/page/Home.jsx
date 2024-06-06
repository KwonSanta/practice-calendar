import {Box} from "@chakra-ui/react";
import {Navbar} from "../component/Navbar.jsx";
import {Outlet} from "react-router-dom";

export function Home() {
  return (
    <Box mb={300}>
      <Navbar />
      <Box
        mx={{
          base: 0,
          lg: 200,
        }}
        mt={10}
      >
        <Outlet />
      </Box>
    </Box>
  );
}