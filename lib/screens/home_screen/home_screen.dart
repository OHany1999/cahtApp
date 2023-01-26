import 'package:chat_app/base.dart';
import 'package:chat_app/dataBase/database_utils.dart';
import 'package:chat_app/models/room_models/room.dart';
import 'package:chat_app/screens/add_room/add_room.dart';
import 'package:chat_app/screens/home_screen/home_navigator.dart';
import 'package:chat_app/screens/home_screen/home_screen_vm.dart';
import 'package:chat_app/screens/home_screen/room_widget.dart';
import 'package:chat_app/screens/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  Navigator.pushNamed(context, AddRoomScreen.routeName);
                },
                child: Icon(Icons.add),
              ),
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text('Chat App'),
                actions: [
                  IconButton(
                    onPressed: ()async{
                      FirebaseAuth.instance.signOut();
                      final prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      goToSignInScreen();
                  }, icon: Icon(Icons.exit_to_app),),
                ],
              ),
            body: StreamBuilder<QuerySnapshot<Room>>(
              stream: DataBaseUtils.getRoomFromFireStore(),
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
                List<Room> roomList =snapshot.data!.docs.map((doc) => doc.data()).toList();
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context,index){
                      return RoomWidget(roomList[index]);
                    },
                    itemCount: roomList.length,
                  ),
                );
              },
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
