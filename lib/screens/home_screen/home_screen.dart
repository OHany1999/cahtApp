import 'package:chat_app/base.dart';
import 'package:chat_app/screens/home_screen/home_navigator.dart';
import 'package:chat_app/screens/home_screen/home_screen_vm.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen,HomeScreenViewModel>
    implements HomeScreenNavigator{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }


  @override
  HomeScreenViewModel initViewModel() {
    return HomeScreenViewModel();
  }
}
