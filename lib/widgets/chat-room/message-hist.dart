import "package:flutter/material.dart";
import "./message-log.dart";
import "package:provider/provider.dart";
import '../../providers/message-center.dart';

class MessageHist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageCetner>(
      builder: (ctx, messageCenter, child) => ListView.builder(
        shrinkWrap: true,
        itemCount: messageCenter.messageHistory.length,
        itemBuilder: (BuildContext cxt, int index) {
          var item = messageCenter.messageHistory[index];
          return MessageLog(
            name: item.user,
            msg: item.message,
            imageUrl: item.imageUrl,
          );
        },
      ),
    );
  }
}
