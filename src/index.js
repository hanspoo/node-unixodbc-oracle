import express from "express";
import { Employees } from "./Employees.js";
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/employees", async (req, res) => {
  const employees = await Employees.findAll(); // Assume this function fetches data from Oracle DB
  res.send(employees);
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
