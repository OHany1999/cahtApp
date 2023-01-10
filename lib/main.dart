import 'package:chat_app/screens/create_account/create_account.dart';
import 'package:chat_app/screens/home_screen/home_screen.dart';
import 'package:chat_app/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        CreateAccountScreen.routeName:(context)=>CreateAccountScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
    );
  }
}

