class Room{

  String id;
  String createdGroupId;
  String RoomName;
  String RoomDescription;
  String CatId;
  int dateTime;
  String receiverId;



  Room(
      {
        this.id='',
        required this.createdGroupId,
        required this.RoomName,
        required this.RoomDescription,
        required this.CatId,
        required this.dateTime,
        required this.receiverId,
      });


  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'createdGroupId':createdGroupId,
      'RoomName':RoomName,
      'RoomDescription':RoomDescription,
      'CatId':CatId,
      'dateTime':dateTime,
      'receiverId':receiverId,
    };
  }

  Room.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    createdGroupId: json['createdGroupId'],
    RoomName: json['RoomName'],
    RoomDescription: json['RoomDescription'],
    CatId: json['CatId'],
    dateTime: json['dateTime'],
    receiverId: json['receiverId'],
  );

}