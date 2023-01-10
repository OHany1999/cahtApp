import 'package:chat_app/base.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/screens/home_screen/home_screen.dart';
import 'package:chat_app/screens/login/login_navigator.dart';
import 'package:chat_app/screens/login/login_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../create_account/create_account.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginScreen, LoginScreenViewModel>
    implements LoginNavigator{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator =this;
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
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text('Login'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text){
                          bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text!);
                          if (text == null || text.isEmpty) {
                            return 'Please Enter Email Address';
                          }else if (emailValid == false){
                            return 'Please Enter Valid Email Address';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (text){
                          if(text == null || text.isEmpty){
                            return 'please Enter Password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          validateForm();
                        },
                        child: Text('Login',),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: (){
                          goToCreateAccountScreen();
                        },
                        child: Text("Don't Have An Account? "),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  void validateForm()async{
    if(formKey.currentState!.validate()){
      viewModel.login(email: emailController.text, password: passwordController.text);
      formKey.currentState!.reset();
    }
  }


  @override
  LoginScreenViewModel initViewModel() {
    return LoginScreenViewModel();
  }

  @override
  void goToHome(MyUser myUser) {
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,(route) => false,);
  }

  @override
  void goToCreateAccountScreen() {
    Navigator.pushNamedAndRemoveUntil(context,CreateAccountScreen.routeName,(route) => false,);
  }
}
