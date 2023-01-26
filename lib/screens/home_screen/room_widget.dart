import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

import '../../models/room_models/room.dart';

class RoomWidget extends StatelessWidget {
Room room;
RoomWidget(this.room);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ChatScreen.routeName,arguments: room);
      },
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/${room.CatId}.png',width: 80,height: 100,),
            SizedBox(height: 5.0,),
            Text(room.RoomName),
          ],
        ),
      ),
    );
  }
}
