import 'package:chat_app/base.dart';
import 'package:chat_app/dataBase/database_utils.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/screens/create_account/create_account_navigator.dart';
import 'package:chat_app/shared/constants/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator> {
  DataBaseUtils dataBaseUtils = DataBaseUtils();

  void createAccountAndPassword(
      {required String email,
        required String password,
        required String FirstName,
        required String LastName,
        required String UserName,
      }) async {
    try {
      navigator!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      dataBaseUtils.addUsersToFirebase(
        MyUser(
          id: credential.user?.uid??'',
          fName: FirstName,
          lName: LastName,
          UserName: UserName,
          Email: email,
        ),
      );
      navigator!.goToHome();
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseErrors.weaPassword) {
        navigator!.showMessage('The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == FireBaseErrors.emailAlreadyUsed) {
        navigator!.showMessage('The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
