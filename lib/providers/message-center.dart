import 'dart:convert';
import 'package:flutter/material.dart';
import "package:flutter/foundation.dart";
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as Socket_IO;
import 'dart:io';
import 'dart:async';

import '../models/Message.dart';

const endpoint = 'http://localhost:3000/clatter/room/message';

class MessageCenter with ChangeNotifier {
  String currentUser = 'Mike';
  List<Message> messageHistory = [];
  ScrollController scrollController = new ScrollController();
  Socket_IO.Socket socket;
  MessageCenter() {
    socket = Socket_IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('connection', (_) => print('connected'));

    socket.on('all messages', (data) {
      if (messageHistory.length != 0) {
        return;
      }
      messageHistory = parsePhotos(data);
      notifyListeners();
    });

    socket.on('new message', (data) {
      messageHistory.add(Message.fromJson(data));
      notifyListeners();
    });

    socket.emit('all messages');
  }

  void appendMessage(String name, String msg, String imageUrl) {
    this.socket.emit('new message', {
      'name': name,
      'message': msg,
      'imageUrl': imageUrl,
    });
    this.messageHistory.add(
        Message(name, msg, new DateTime.now().toIso8601String(), imageUrl));
    notifyListeners();
  }

  List<Message> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Message>((json) => Message.fromJson(json)).toList();
  }
}
