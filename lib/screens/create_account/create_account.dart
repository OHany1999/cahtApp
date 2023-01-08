import 'package:chat_app/base.dart';
import 'package:chat_app/screens/create_account/connector.dart';
import 'package:chat_app/screens/create_account/create_account_vm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = 'createAccount';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends BaseView<CreateAccountScreen,CreateAccountViewModel>{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var userNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> viewModel,
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
              title: Text('Create Account'),
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
                      validator: (text){
                        if(text == null || text.isEmpty){
                          return 'please Enter FirstName';
                        }
                        return null;
                      },
                      controller: firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
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
                      validator: (text){
                        if(text == null || text.isEmpty){
                          return 'please Enter LastName';
                        }
                        return null;
                      },
                      controller: lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
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
                      validator: (text){
                        if(text == null || text.isEmpty){
                          return 'please Enter UserName';
                        }
                        return null;
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: 'UserName',
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
                        createAccount();
                      },
                      child: Text('Create Account',),
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

  void createAccount()async{
    if(formKey.currentState!.validate()){
      viewModel.createAccountAndPassword(email: emailController.text, password: passwordController.text);
      formKey.currentState!.reset();
    }
  }



  @override
  CreateAccountViewModel initViewModel() {
    return CreateAccountViewModel();
  }

  @override
  void hideDialog() {
    // TODO: implement hideDialog
  }
}
