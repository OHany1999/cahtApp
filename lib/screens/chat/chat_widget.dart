import 'package:chat_app/models/chat_model/message.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/shared/components/ui_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../dataBase/database_utils.dart';

class ChatWidget extends StatefulWidget {
  Message message;

  ChatWidget(this.message);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    return userId == widget.message.senderId
        ? SenderMessage(widget.message)
        : ReceiverMessage(widget.message);
  }
}

class SenderMessage extends StatefulWidget {
  Message message;

  SenderMessage(this.message);

  @override
  State<SenderMessage> createState() => _SenderMessageState();
}

class _SenderMessageState extends State<SenderMessage> {
  @override
  Widget build(BuildContext context) {
    int ts = widget.message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onLongPress: () {
          showMessage(
              'Delete message',
              context,
              'ok',
              () {
                DataBaseUtils.deleteMessageFromFirebase(
                    widget.message.roomId, widget.message.id);
                hideLoading(context);
              },
              negBtn: 'cancel',
              negAction: () {
                hideLoading(context);
              });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18))),
                child: Text(widget.message.content)),
            Text(date.substring(12))
          ],
        ),
      ),
    );
  }
}

class ReceiverMessage extends StatefulWidget {
  Message message;

  ReceiverMessage(this.message);

  @override
  State<ReceiverMessage> createState() => _ReceiverMessageState();
}

class _ReceiverMessageState extends State<ReceiverMessage> {
  @override
  Widget build(BuildContext context) {
    int ts = widget.message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18))),
              child: Text(widget.message.content)),
          Text(date.substring(12))
        ],
      ),
    );
  }
}
