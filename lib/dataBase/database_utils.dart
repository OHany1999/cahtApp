import 'package:chat_app/models/my_user.dart';
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

  static Future<void> addUsersToFirebase(MyUser myUser) async {

    return getTaskCollection().doc(myUser.id).set(myUser);

  }

  static Future<MyUser?> readFromFirebase(String id) async{
    DocumentSnapshot<MyUser> userRef = await getTaskCollection().doc(id).get();
    return userRef.data();
  }
}
