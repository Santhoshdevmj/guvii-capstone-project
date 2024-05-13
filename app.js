const express = require("express");
const logger = require("morgan");
const path = require("path");
const compression = require("compression");
const app = express();

app.use(logger("dev"));
app.use(express.static("./build"));
app.use("/static", express.static("ui"));
app.use(compression());

app.get("/*", function (req, res) {
  res
    .set({
      "X-Frame-Options": "deny",
    })
    .sendFile(path.join(__dirname, "./build", "index.html"));
});

const PORT = 80;

app.listen(PORT, "0.0.0.0", () => {
  console.log(`App listening on port ${PORT}!`);
});
