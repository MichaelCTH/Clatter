const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
const port = 3000;

class Message {
  constructor(name, message, createdTime, imageUrl) {
    this.name = name;
    this.message = message;
    this.createdTime = createdTime;
    this.imageUrl = imageUrl;
  }
}

let messageList = [
  new Message("Jerry", "How are you? Bro", new Date().toDateString(), "assets/images/avatar.png"),
  new Message(
    "Jerry",
    "I'm just back to town",
    new Date().toDateString(),
    "assets/images/avatar.png"
  ),
  new Message(
    "Jerry",
    "are you free tomorrow night?",
    new Date().toDateString(),
    "assets/images/avatar.png"
  ),
  new Message(
    "Jerry",
    "let's hang out and grab some drinks",
    new Date().toDateString(),
    "assets/images/avatar.png"
  ),
  new Message(
    "Jerry",
    "first round on me :p",
    new Date().toDateString(),
    "assets/images/avatar.png"
  ),
];

app.get("/clatter/room/message", (req, res) => {
  res.json(messageList);
});

app.post("/clatter/room/message", (req, res) => {
  const data = req.body;
  if (!data.name || !data.message || !data.imageUrl) {
    res.sendStatus(400);
  }
  messageList.push(new Message(data.name, data.message, new Date().toDateString(), data.imageUrl));
  res.sendStatus(200);
});

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`));
