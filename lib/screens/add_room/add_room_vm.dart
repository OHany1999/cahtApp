import 'package:chat_app/base.dart';
import 'package:chat_app/dataBase/database_utils.dart';
import 'package:chat_app/models/room_models/room.dart';
import 'package:chat_app/screens/add_room/add_room_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void CreateRoom(String RoomName, String RoomDescription, String CatId,String receiverId) {
    var myId =FirebaseAuth.instance.currentUser?.uid ?? '';
    Room room = Room(
        RoomName: RoomName,
        RoomDescription: RoomDescription,
        CatId: CatId,
        dateTime: DateTime.now().microsecondsSinceEpoch,
      createdGroupId: myId,
      receiverId: receiverId,
    );
    DataBaseUtils.addRoomToFirebase(room).then((value) {
      navigator!.RoomCreated();
    }).catchError((error) {
      navigator!.showMessage(error);
    });
  }
}
