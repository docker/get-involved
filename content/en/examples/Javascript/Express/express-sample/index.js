const express = require("express");
const mongoose = require("mongoose");
const app = express();
const DATABASE = "mongodb://mymongo:27017/testdb";

//$ docker-compose up --build

mongoose
  .connect(DATABASE)
  .then(() => {
    console.log("Connected to database!!");
  })
  .catch((err) => {
    console.log(`Database Error!! : ${err}`);
  });
app.get("/", (req, res) => {
  res.json({
    message: "Welcome to the API",
  });
});

app.listen(5000, () => {
  console.log("Server started on port 5000");
});
