import { ChakraProvider } from "@chakra-ui/react";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { Home } from "./page/Home.jsx";
import { Reserve } from "./page/Reserve.jsx";
import { SpaceRegister } from "./page/host/SpaceRegister.jsx";

function App() {
  const router = createBrowserRouter([
    {
      path: "/",
      element: <Home />,
      children: [
        {
          path: "reserve",
          element: <Reserve />,
        },
        { path: "space/register", element: <SpaceRegister /> },
        {},
      ],
    },
  ]);

  return (
    <>
      <ChakraProvider>
        <RouterProvider router={router} />
      </ChakraProvider>
    </>
  );
}

export default App;
