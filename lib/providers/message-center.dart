import 'package:flutter/material.dart';
import "package:flutter/foundation.dart";
import '../models/Message.dart';

class MessageCetner with ChangeNotifier {
  String currentUser = 'Mike';
  List<Message> messageHistory = [
    Message('Jerry', 'How are you?', new DateTime.now(),
        'assets/images/avatar.png'),
    Message('Jerry', 'I just back to town', new DateTime.now(),
        'assets/images/avatar.png'),
    Message('Jerry', 'are you free tomorrow', new DateTime.now(),
        'assets/images/avatar.png'),
    Message('Jerry', 'let\'s hang out and grab some drinks', new DateTime.now(),
        'assets/images/avatar.png'),
    Message('Jerry', 'first round on me :)', new DateTime.now(),
        'assets/images/avatar.png'),
  ];

  void appendMessage(String name, String msg, String imageUrl) {
    this.messageHistory.add(Message(name, msg, new DateTime.now(), imageUrl));
    notifyListeners();
  }

  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}
