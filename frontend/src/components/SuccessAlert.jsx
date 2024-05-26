import * as React from "react";
import Alert from "@mui/material/Alert";
import AlertTitle from "@mui/material/AlertTitle";

export default function SuccessAlert(props) {
  return (
    <Alert severity="success">
      <AlertTitle>Success</AlertTitle>
      {props.subtitle}
    </Alert>
  );
}
