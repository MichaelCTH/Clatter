import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "package:provider/provider.dart";
import '../../providers/message-center.dart';

class MessageLog extends StatelessWidget {
  final String name;
  final String msg;
  final String imageUrl;

  MessageLog({
    @required this.name,
    @required this.msg,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    _isMyself() =>
        Provider.of<MessageCenter>(context, listen: false).currentUser ==
        this.name;

    var msgLen = 200.0;
    if (this.msg.length < 25) {
      msgLen = this.msg.length * 6.5 + 29;
    }

    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        textDirection: _isMyself() ? TextDirection.rtl : TextDirection.ltr,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
              image: AssetImage(this.imageUrl),
              width: 48,
              height: 48,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: _isMyself()
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Text('${this.name}'),
                SizedBox(height: 2),
                Container(
                  width: msgLen,
                  decoration: BoxDecoration(
                      color:
                          _isMyself() ? Colors.lightGreenAccent : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                  child: Text('${this.msg}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
