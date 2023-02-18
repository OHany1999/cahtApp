import 'dart:isolate';

import 'package:chat_app/base.dart';
import 'package:chat_app/models/chat_model/message.dart';
import 'package:chat_app/models/room_models/room.dart';
import 'package:chat_app/screens/chat/chat_Viewmodel.dart';
import 'package:chat_app/screens/chat/chat_navigator.dart';
import 'package:chat_app/screens/chat/chat_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = "chat";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseView<ChatScreen, ChatViewModel>
    implements ChatNavigator {

  var messageController= TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var room = ModalRoute.of(context)!.settings.arguments as Room;

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),


          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(room.RoomName),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot<Message>>(
                      stream: viewModel.showMessage(room.id),
                        builder: (context,snapshot){
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: Container());
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                children: [
                                  Text('Something went wrong'),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('Try Again'),
                                  ),
                                ],
                              ),
                            );
                          }
                          List<Message> messageList= snapshot.data!.docs.map((docs) => docs.data()).toList();
                          return ListView.builder(
                            controller: scrollController,
                            itemCount: messageList.length ,
                              itemBuilder: (context,index){
                              return ChatWidget(messageList[index]);
                              },

                          );
                        },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(12),
                          height: 50,
                          child: TextFormField(
                            controller: messageController,
                            decoration: InputDecoration(
                              hintText: " Type a message",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                ),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                ),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.sendMessage(
                                messageController.text,
                                room.id,);
                            try{
                              messageController.clear();
                              scrollController.animateTo(
                                scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            }catch(e){
                              print(e);
                            }


                          },
                          child: Row(
                            children: [
                              Text('Send'),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.send,size: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ChatViewModel initViewModel() {
    // TODO: implement initViewModel
    return ChatViewModel();
  }
}
