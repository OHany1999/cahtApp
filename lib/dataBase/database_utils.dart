
import 'package:chat_app/models/chat_model/message.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/models/room_models/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseUtils {

  static CollectionReference<MyUser> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection('MyUser')
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJson(snapshot.data()!),
          toFirestore: (MyUser, options) => MyUser.toJson(),
        );
  }

  //for create account
  static Future<void> addUsersToFirebase(MyUser myUser){
    return getTaskCollection().doc(myUser.id).set(myUser);
  }

  // for login
  static Future<MyUser?> readFromFirebase(String id) async{
    DocumentSnapshot<MyUser> userRef = await getTaskCollection().doc(id).get();
    return userRef.data();
  }

  //-------------------------------------------------------

  static CollectionReference<Room> getRoomsCollection() {
    return FirebaseFirestore.instance
        .collection('Room')
        .withConverter<Room>(
      fromFirestore: (snapshot, options) =>
          Room.fromJson(snapshot.data()!),
      toFirestore: (room, options) => room.toJson(),
    );
  }

  static Future<void> addRoomToFirebase(Room room) {
    var docRef = getRoomsCollection().doc();
    room.id = docRef.id;
    return docRef.set(room);
  }

  static Stream<QuerySnapshot<Room>> getRoomFromFireStore(){
    var data= getRoomsCollection().orderBy('dateTime').snapshots();
    return data;
  }
  static void deleteRoomFromFirebase(String roomId){
   getRoomsCollection().doc(roomId).delete();
  }

  //----------------------------------------------------

  static CollectionReference<Message> getMessageCollection(String roomId) {
    return getRoomsCollection().doc(roomId).collection('Message').withConverter(
        fromFirestore: (snapshot,option)=>Message.fromJson(snapshot.data()!),
        toFirestore: (value,option)=>value.toJson(),
    );
  }

  static Future<void>  addMessageToFirestore(Message message){
    var docRef = getMessageCollection(message.roomId).doc();
    message.id = docRef.id;
    return docRef.set(message);
  }

  static Stream<QuerySnapshot<Message>> readMessages(String roomId){
    return getMessageCollection(roomId).orderBy('dateTime').snapshots();
  }
  static void deleteMessageFromFirebase(String roomId,String messageId){
    getMessageCollection(roomId).doc(messageId).delete();
  }


  //-----------------------------------------------------


}
