import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  static const String routeName = 'createAccount';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
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
                      if(text!.isEmpty){
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
                      if(text!.isEmpty){
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
                      if(text!.isEmpty){
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
                    validator: (text){
                      if(text!.isEmpty){
                        return 'please Enter Email';
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
                    validator: (text){
                      if(text!.isEmpty){
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
    );
  }

  void createAccount(){
    if(formKey.currentState!.validate()){
      formKey.currentState!.reset();
      print('done');
    }
  }


}
