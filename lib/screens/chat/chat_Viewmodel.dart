import 'package:chat_app/dataBase/database_utils.dart';
import 'package:chat_app/models/chat_model/message.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/screens/chat/chat_navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../base.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator> {


  void sendMessage(String content, String roomId) async {
    // عشان محتاج منها الid والfirstName بتاع الuser
    MyUser? myUser = await DataBaseUtils.readFromFirebase(
        FirebaseAuth.instance.currentUser!.uid);
    Message message = Message(
      content: content,
      dateTime: DateTime
          .now()
          .millisecondsSinceEpoch,
      senderId: myUser!.id,
      senderName: myUser.fName,
      roomId: roomId,
    );
    DataBaseUtils.addMessageToFirestore(message);
  }

  Stream<QuerySnapshot<Message>> showMessage(String roomId) {
    return DataBaseUtils.readMessages(roomId);
  }
}
