import 'package:flutter/material.dart';
import "./message-bar.dart";
import "./message-hist.dart";

class ChatRoomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                child: MessageHist(),
              ),
            ),
            MessageBar(),
          ],
        ),
      ],
    );
  }
}
