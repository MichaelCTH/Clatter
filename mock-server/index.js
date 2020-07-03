// Setup basic express server
var express = require("express");
var app = express();
var path = require("path");
var server = require("http").createServer(app);
var io = require("socket.io")(server);
var port = process.env.PORT || 3000;

server.listen(port, () => {
  console.log("Server listening at port %d", port);
});

// Chatroom
let chatHistory = [];

io.on("connection", (socket) => {
  socket.on("all messages", () => {
    socket.emit("all messages", JSON.stringify(chatHistory));
  });

  socket.on("new message", (data) => {
    chatHistory.push(data);
    socket.broadcast.emit("new message", data);
  });
});
