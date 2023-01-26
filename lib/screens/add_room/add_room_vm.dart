import 'package:chat_app/base.dart';
import 'package:chat_app/dataBase/database_utils.dart';
import 'package:chat_app/models/room_models/room.dart';
import 'package:chat_app/screens/add_room/add_room_navigator.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void CreateRoom(String RoomName, String RoomDescription, String CatId) {
    Room room = Room(
        RoomName: RoomName, RoomDescription: RoomDescription, CatId: CatId,dateTime: DateTime.now().microsecondsSinceEpoch);
    DataBaseUtils.addRoomToFirebase(room).then((value) {
      navigator!.RoomCreated();
    }).catchError((error) {
      navigator!.showMessage(error);
    });
  }
}
