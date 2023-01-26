import 'package:chat_app/base.dart';
import 'package:chat_app/models/room_models/room_category.dart';
import 'package:chat_app/screens/add_room/add_room_navigator.dart';
import 'package:chat_app/screens/add_room/add_room_vm.dart';
import 'package:chat_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'add_room';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var roomNameController = TextEditingController();
  var roomDescriptionController = TextEditingController();
  var categories= RoomCategory.getCategories();
  late RoomCategory roomCategory = categories.first;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
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
              title: Text('Add Room'),
            ),
            body: Card(
              elevation: 16,
              margin: EdgeInsets.symmetric(horizontal: 21, vertical: 42),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Create New Room',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      Image.asset('assets/images/Group.png'),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: roomNameController,
                        textInputAction: TextInputAction.next,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter Room name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Room Name',
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
                        height: 20.0,
                      ),
                      DropdownButton<RoomCategory>(
                        value: roomCategory,
                          isExpanded: true,
                          items: categories.map((cat) => DropdownMenuItem<RoomCategory>(
                            value: cat,
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Image.asset(cat.image),
                            SizedBox(width: 20,),
                            Text(cat.name),
                          ],
                        ),
                      ),
                      ).toList(),
                          onChanged: (value){
                          if(value == null) return;
                          roomCategory = value;
                          setState(() {

                          });

                          }
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: roomDescriptionController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'please Enter Room description';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Room description',
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
                          if(formKey.currentState!.validate()){
                            viewModel.CreateRoom(
                                roomNameController.text,
                                roomDescriptionController.text,
                                roomCategory.name,
                            );
                            RoomCreated();
                          }
                        },
                        child: Text(
                          'Create',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
  }

  @override
  void RoomCreated() {
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);

  }
}
