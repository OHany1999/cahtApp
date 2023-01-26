import 'package:chat_app/screens/add_room/add_room.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:chat_app/screens/create_account/create_account.dart';
import 'package:chat_app/screens/home_screen/home_screen.dart';
import 'package:chat_app/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  var idKey = prefs.getString('id');
  print('IdKey is ##############: ${idKey}');
  runApp(
      MyApp(idKey)
  );
}

class MyApp extends StatelessWidget {
  var idKey;
  MyApp(this.idKey);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: idKey !=null ? HomeScreen.routeName :LoginScreen.routeName,
      routes: {
        CreateAccountScreen.routeName:(context)=>CreateAccountScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        AddRoomScreen.routeName:(context)=>AddRoomScreen(),
        ChatScreen.routeName:(context)=>ChatScreen(),
      },
    );
  }
}

