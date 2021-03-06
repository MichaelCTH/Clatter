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
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.keyboard_voice,
            color: Colors.black54,
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
              onSubmitted: (value) => _sendMessage(value, context),
            ),
          ),
          Icon(
            Icons.tag_faces,
            color: Colors.black54,
            size: 30.0,
          ),
          Icon(
            Icons.add_circle_outline,
            color: Colors.black54,
            size: 30.0,
          ),
        ],
      ),
    );
  }

  _sendMessage(value, context) {
    if (value.isEmpty) {
      return;
    }
    var provider = Provider.of<MessageCenter>(context, listen: false);
    provider.appendMessage('Mike', value, 'assets/images/Mac.jpg');
    provider.scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 1000),
    );
    this._clearTextInput();
  }
}
