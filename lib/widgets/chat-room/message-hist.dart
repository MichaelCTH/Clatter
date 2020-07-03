import "package:flutter/material.dart";
import "./message-log.dart";
import "package:provider/provider.dart";
import '../../providers/message-center.dart';

class MessageHist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageCenter>(
      builder: (ctx, messageCenter, child) {
        final listLen = messageCenter.messageHistory.length;
        return ListView.builder(
          shrinkWrap: true,
          reverse: listLen > 9,
          controller: messageCenter.scrollController,
          itemCount: listLen,
          itemBuilder: (BuildContext cxt, int index) {
            var idx = index;
            if (listLen > 9) {
              idx = listLen - index - 1;
            }
            var item = messageCenter.messageHistory[idx];
            return MessageLog(
              name: item.user,
              msg: item.message,
              imageUrl: item.imageUrl,
            );
          },
        );
      },
    );
  }
}
