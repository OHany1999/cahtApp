import 'package:chat_app/screens/create_account/create_account.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CreateAccountScreen.routeName,
      routes: {
        CreateAccountScreen.routeName:(context)=>CreateAccountScreen(),
      },
    );
  }
}

