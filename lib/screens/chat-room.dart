import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../widgets/chat-room/chat-room-content.dart';

class Chatroom extends StatelessWidget {
  final String roomName;

  Chatroom({@required this.roomName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 30.0,
              ),
              Text(
                this.roomName,
                style: TextStyle(color: Colors.black),
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.black,
                size: 25.0,
              ),
            ],
          ),
          centerTitle: false,
          backgroundColor: Colors.grey[100],
        ),
      ),
      body: ChatRoomContent(),
    );
  }
}
