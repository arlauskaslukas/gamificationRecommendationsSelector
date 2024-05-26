import * as React from "react";
import Alert from "@mui/material/Alert";
import AlertTitle from "@mui/material/AlertTitle";

export default function WarningAlert(props) {
  return (
    <Alert severity="warning">
      <AlertTitle>Woah slow down there buckaroo!</AlertTitle>
      {props.subtitle}
    </Alert>
  );
}
