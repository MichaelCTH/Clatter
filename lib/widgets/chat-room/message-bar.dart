import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../providers/message-center.dart';

class MessageBar extends StatelessWidget {
  final msgInputController = TextEditingController();

  _clearTextInput() {
    this.msgInputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.keyboard_voice,
            color: Colors.black,
            size: 30.0,
          ),
          Container(
            width: 250.0,
            height: 40.0,
            color: Colors.white,
            child: TextField(
              controller: msgInputController,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15.0),
              ),
              onSubmitted: (value) {
                if (value.isEmpty) {
                  return;
                }
                Provider.of<MessageCetner>(context, listen: false)
                    .appendMessage('Mike', value, 'assets/images/Mac.jpg');
                this._clearTextInput();
              },
            ),
          ),
          Icon(
            Icons.tag_faces,
            color: Colors.black,
            size: 30.0,
          ),
          Icon(
            Icons.add_circle_outline,
            color: Colors.black,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
