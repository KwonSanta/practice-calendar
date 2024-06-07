import { Box, Flex } from "@chakra-ui/react";
import {
  DatePicker,
  DigitalClock,
  LocalizationProvider,
} from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import {
  createTheme,
  ThemeProvider as MUIThemeProvider,
} from "@mui/material/styles";

const muiTheme = createTheme();

export function Reserve() {
  return (
    <Box>
      <MUIThemeProvider theme={muiTheme}>
        <LocalizationProvider dateAdapter={AdapterDayjs} adapterLocale="ko">
          <Box>
            <Flex>
              <DatePicker />
              <Box>
                <DigitalClock timeStep={60} disablePast />
              </Box>
              <Box>
                <DigitalClock timeStep={60} disablePast />
              </Box>
            </Flex>
          </Box>
        </LocalizationProvider>
      </MUIThemeProvider>
    </Box>
  );
}
