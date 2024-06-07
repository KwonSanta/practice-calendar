import "react-datepicker/dist/react-datepicker.css";
import { useState } from "react";
import DatePicker from "react-datepicker";
import { Box } from "@chakra-ui/react";

export function Reserve() {
  const [startDate, setStartDate] = useState(new Date());
  const [endDate, setEndDate] = useState(new Date());

  // 날짜 객체
  const today = new Date();
  const maxDate = new Date(today.setMonth(today.getMonth() + 3));

  return (
    <Box>
      <Box>
        <DatePicker
          showIcon
          selected={endDate}
          onChange={(date) => setEndDate(date)}
          dateFormat="Pp"
          timeintervals={30} // 30분 단위로 선택 가능한 box가 나오게 설정
          toggleCalendarOnIconClick
          isClearable
          showTimeSelect
          timeIntervals={60}
          inline
          minDate={new Date()}
          maxDate={maxDate}
        />
      </Box>
      <Box></Box>
    </Box>
  );
}
