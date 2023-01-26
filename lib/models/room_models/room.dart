class Room{

  String id;
  String RoomName;
  String RoomDescription;
  String CatId;
  int dateTime;


  Room(
      { this.id='',
        required this.RoomName,
        required this.RoomDescription,
        required this.CatId,
        required this.dateTime,
      });


  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'RoomName':RoomName,
      'RoomDescription':RoomDescription,
      'CatId':CatId,
      'dateTime':dateTime,
    };
  }

  Room.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    RoomName: json['RoomName'],
    RoomDescription: json['RoomDescription'],
    CatId: json['CatId'],
    dateTime: json['dateTime'],
  );

}