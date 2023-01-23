import 'package:chat_app/base.dart';
import 'package:chat_app/screens/home_screen/home_navigator.dart';
import 'package:chat_app/screens/home_screen/home_screen_vm.dart';
import 'package:chat_app/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeScreenViewModel>
    implements HomeScreenNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>viewModel,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
              //بيثبت الwidgets عشان متطلعش لفوق في حالة فتح الkeybord
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0.0,
                title: Text('Chat'),
              ),
            body: ElevatedButton(
              onPressed: ()async{
                FirebaseAuth.instance.signOut();
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                goToSignInScreen();
              },
              child: Text('SignOut'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeScreenViewModel initViewModel() {
    return HomeScreenViewModel();
  }

  @override
  void goToSignInScreen() {
    // TODO: implement goToSignInScreen
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
  }
}
