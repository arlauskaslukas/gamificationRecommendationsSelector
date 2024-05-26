import {
  Button,
  Grid,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  TextField,
  Typography,
} from "@mui/material";
import "./App.css";
import ResponsiveAppBar from "./components/NavBar";
import ErrorAlert from "./components/ErrorAlert";
import { useState } from "react";

function App() {
  const [domain, setDomain] = useState("");
  const [ageGroup, setAgeGroup] = useState("");
  const [disorders, setDisorders] = useState("");
  const [gamificationGoals, setGamificationGoals] = useState("");
  const [recommendations, setRecommendations] = useState(undefined);
  const [errors, setErrors] = useState([]);

  const handleDomainChange = (event) => {
    setDomain(event.target.value);
  };
  const handleAgeGroupsChange = (event) => {
    setAgeGroup(event.target.value);
  };
  const handleDisordersChange = (event) => {
    setDisorders(event.target.value);
  };
  const handleGamificationGoalsChange = (event) => {
    setGamificationGoals(event.target.value);
  };
  const handleSubmit = async () => {
    if (
      domain === "" &&
      ageGroup === "" &&
      disorders === "" &&
      gamificationGoals === ""
    ) {
      setErrors(["Please provide atleast one field of information"]);
      return;
    }
    let result = await fetch("http://localhost:8081/api/application", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        applicationDomain: domain,
        ageGroup: ageGroup,
        disorders: disorders,
        gamificationGoal: gamificationGoals,
      }),
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        } else {
          setErrors(["Unexpected error happened"]);
        }
      })
      .then((data) => {
        let result = data.recommendations;
        console.log(result);
        setRecommendations(result);
      })
      .catch((_) => {
        console.log(_);
        setErrors(["Unexpected error happened"]);
      });
  };

  return (
    <div className="App">
      <ResponsiveAppBar />
      <div style={{ paddingInline: "10%", paddingTop: "10%" }}>
        {errors.length !== 0 && <ErrorAlert items={errors} />}
        <Paper elevation={2} style={{ paddingBlock: "20px" }}>
          <div>
            <Typography variant="h4" fontWeight={"bold"}>
              Enter information
            </Typography>
            <Grid container style={{ paddingTop: "20px" }}>
              <Grid
                sm={7}
                style={{ paddingInline: "20px", paddingBottom: "20px" }}
              >
                <TextField
                  label="Application domain"
                  variant="standard"
                  value={domain}
                  onChange={handleDomainChange}
                  style={{ width: "100%" }}
                />
              </Grid>
              <Grid sm={5} style={{ paddingInline: "20px" }}>
                <TextField
                  label="Age group"
                  value={ageGroup}
                  onChange={handleAgeGroupsChange}
                  variant="standard"
                  style={{ width: "100%" }}
                />
              </Grid>
              <Grid sm={7} style={{ paddingInline: "20px" }}>
                <TextField
                  label="Disorders"
                  value={disorders}
                  onChange={handleDisordersChange}
                  variant="standard"
                  style={{ width: "100%" }}
                />
              </Grid>
              <Grid sm={5} style={{ paddingInline: "20px" }}>
                <TextField
                  label="Gamification goals"
                  value={gamificationGoals}
                  onChange={handleGamificationGoalsChange}
                  variant="standard"
                  style={{ width: "100%" }}
                />
              </Grid>
            </Grid>
            <div
              style={{
                display: "flex",
                flexDirection: "row",
                justifyContent: "flex-end",
                paddingInline: "20px",
                marginTop: "20px",
              }}
            >
              <Button variant="contained" onClick={handleSubmit}>
                {" "}
                Obtain recommendations
              </Button>
            </div>
          </div>
        </Paper>
        {recommendations !== undefined && (
          <div
            style={{
              paddingTop: "20px",
              display: "flex",
              flexDirection: "row",
              justifyContent: "center",
            }}
          >
            {recommendations.length > 0 ? (
              <TableContainer component={Paper}>
                <Table sx={{ minWidth: "700px" }}>
                  <TableHead>
                    <TableRow style={{ backgroundColor: "blue" }}>
                      <TableCell style={{ color: "white", fontWeight: "bold" }}>
                        Recommendation
                      </TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {recommendations.map((recommendation) => (
                      <TableRow key={recommendation}>
                        <TableCell
                          style={{ color: "black", fontWeight: "bold" }}
                        >
                          {recommendation}
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </TableContainer>
            ) : (
              <Typography variant="h5">
                No gamification recommendations fit the criteria
              </Typography>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

export default App;
