import * as React from "react";
import Alert from "@mui/material/Alert";
import AlertTitle from "@mui/material/AlertTitle";

export default function ErrorAlert(props) {
  return (
    <Alert severity="error">
      <AlertTitle>Error</AlertTitle>
      {props.items && (
        <ul>
          {props.items.map((item, idx) => (
            <li key={idx}>{item}</li>
          ))}
        </ul>
      )}
    </Alert>
  );
}
