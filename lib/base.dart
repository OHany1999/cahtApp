import 'package:flutter/material.dart';

// viewModel
class BaseViewModel<T extends BaseNavigator> extends ChangeNotifier {
  T? navigator = null;
}

// connector
abstract class BaseNavigator {
  void showLoading({String message});
  void showMessage(String message);
  void hideLoading();
}

// view
abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator{
  late VM viewModel;

  //بيجبرك تديله viewModel
  VM initViewModel();

  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initViewModel();
  }

  void hideLoading() {
    Navigator.pop(context);
  }

  void showLoading({String message = 'loading...'}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Row(
            children: [
              CircularProgressIndicator(),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }

  void showMessage(String Message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(Message),
        ),
      ),
    );
  }
}
