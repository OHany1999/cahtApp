import 'package:chat_app/base.dart';
import 'package:chat_app/screens/create_account/connector.dart';
import 'package:chat_app/shared/constants/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator>{

  void createAccountAndPassword({required String email,required String password})async{
    try {
      navigator!.showLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigator!.hideDialog();
      navigator!.showMessage('successfully Created');
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseErrors.weaPassword) {
        navigator!.hideDialog();
        navigator!.showMessage('The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == FireBaseErrors.emailAlreadyUsed) {
        navigator!.hideDialog();
        navigator!.showMessage('The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}