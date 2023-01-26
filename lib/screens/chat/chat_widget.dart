import 'package:chat_app/models/chat_model/message.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../dataBase/database_utils.dart';

class ChatWidget extends StatelessWidget {


  Message message;
  ChatWidget(this.message);

  @override
  Widget build(BuildContext context) {
    var userId =FirebaseAuth.instance.currentUser?.uid ?? '';
    return userId == message.senderId ? SenderMessage(message):ReceiverMessage(message);
  }
}

class SenderMessage extends StatelessWidget {
  Message message;
  SenderMessage(this.message);
  @override
  Widget build(BuildContext context) {
    int ts = message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              child: Text(message.content)),
          Text(date.substring(12))
        ],
      ),
    );
  }
}

class ReceiverMessage extends StatelessWidget {
  Message message;
  ReceiverMessage(this.message);
  @override
  Widget build(BuildContext context) {
    int ts = message.dateTime;
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
              child: Text(message.content)),
          Text(date.substring(12))
        ],
      ),
    );
  }
}


