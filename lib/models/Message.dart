import 'package:Clatter/providers/message-center.dart';

class Message {
  final String user;
  final String message;
  final DateTime createdTime;
  final String imageUrl;

  Message(this.user, this.message, this.createdTime, this.imageUrl);
}
