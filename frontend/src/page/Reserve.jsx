import "react-datepicker/dist/react-datepicker.css";
import { useState } from "react";
import DatePicker from "react-datepicker";

export function Reserve() {
  const [startDate, setStartDate] = useState(new Date());

  return (
    <DatePicker
      showIcon
      selected={startDate}
      onChange={(date) => setStartDate(date)}
      dateFormat="Pp"
      timeintervals={30} // 30분 단위로 선택 가능한 box가 나오게 설정
      dateFormat="MMMM d, yyyy hh:mm aa" // June 6, 2024 10:45 PM
      // onSelect={handleDateSelect}
      // onChange={handleDateChange}
    />
  );
}
