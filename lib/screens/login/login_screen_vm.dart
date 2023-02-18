import 'package:chat_app/base.dart';
import 'package:chat_app/dataBase/database_utils.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/screens/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/constants/firebase_errors.dart';

class LoginScreenViewModel extends BaseViewModel<LoginNavigator> {
  FirebaseAuth auth = FirebaseAuth.instance;


  void login({required String email, required String password}) async {
    try {
      navigator!.showLoading();
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      MyUser? myUser =
          await DataBaseUtils.readFromFirebase(credential.user?.uid ?? '');
      if (myUser != null) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('id', myUser.id);
        navigator!.goToHome(myUser);
      } else {
        navigator!.showMessage('user is Not Found in Database');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        navigator!.showMessage('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        navigator!.showMessage('Wrong password provided for that user.');

        print('Wrong password provided for that user.');
      }
    }
  }
}
