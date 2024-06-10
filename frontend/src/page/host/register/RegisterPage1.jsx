import React from "react";
import { Box, TextField } from "@mui/material";

const RegisterPage1 = ({ formData, setFormData }) => {
  const handleChange = (event) => {
    setFormData({ ...formData, page1Data: event.target.value });
  };

  return (
    <Box>
      <TextField
        label="사용자 이름"
        variant="outlined"
        value={formData.page1Data}
        onChange={handleChange}
        fullWidth
      />
    </Box>
  );
};

export default RegisterPage1;
