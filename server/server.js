// javascript server for reading parts lists

const express = require("express");
const app = express();

app.use(express.json());

const sqlite3 = require('sqlite3').verbose();
const dbName = "rem.db";

const db = new sqlite3.Database(dbName,(err) => {
  if (err){
    console.log(err.message);
  }
  console.log(`Connected to Data Base  ${dbName}.`);
})

const hostPort = 8080;

const server = app.listen(hostPort, () => {
  const host = server.address().address;
  const port = server.address().port;

  console.log(`Listening at http://${host}${port}`);

  const sql = ""

  db.run(sql, [], (err) => {
    if (err){
      console.log(err.message);
    }
    return;
  });
});
