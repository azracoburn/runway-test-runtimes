const express = require("express");
const app = express();

app.use(express.json());

app.get("/health", (req, res) => res.json({ status: "ok" }));

app.get("/", (req, res) => res.json({ message: "runway-test-runtimes API" }));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Listening on :${PORT}`));
