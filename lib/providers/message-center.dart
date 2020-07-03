import 'dart:convert';
import 'package:flutter/material.dart';
import "package:flutter/foundation.dart";
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

import '../models/Message.dart';

const endpoint = 'http://localhost:3000/clatter/room/message';

class MessageCenter with ChangeNotifier {
  String currentUser = 'Mike';
  List<Message> messageHistory = [];
  ScrollController scrollController = new ScrollController();

  MessageCenter() {
    Timer.periodic(new Duration(seconds: 1), (timer) {
      _fetchMessage().then((value) {
        if (value == null) {
          return;
        }
        messageHistory = parsePhotos(value);
        notifyListeners();
      });
    });
  }

  void appendMessage(String name, String msg, String imageUrl) {
    _postMessage({
      'name': name,
      'message': msg,
      'createdTime': new DateTime.now().toIso8601String(),
      'imageUrl': imageUrl,
    }).then((value) {
      if (value) {
        this.messageHistory.add(
            Message(name, msg, new DateTime.now().toIso8601String(), imageUrl));
        notifyListeners();
      }
    });
  }

  List<Message> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Message>((json) => Message.fromJson(json)).toList();
  }

  Future<String> _fetchMessage() async {
    try {
      final response = await http.get(endpoint);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } on SocketException {
      return null;
    }
  }

  Future<bool> _postMessage(dynamic body) async {
    try {
      final response = await http.post(endpoint, body: body);
      return response.statusCode == 200;
    } on SocketException {
      return false;
    }
  }
}
