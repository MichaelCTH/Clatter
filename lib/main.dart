import 'package:Clatter/screens/chat-room.dart';
import 'package:flutter/material.dart';
import './screens/chat-room.dart';
import 'package:provider/provider.dart';
import './providers/message-center.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MessageCetner(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clatter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/chat-background.png'),
              fit: BoxFit.fill),
        ),
        child: Chatroom(
          roomName: 'Fake Clatter Room',
        ),
      ),
    );
  }
}
