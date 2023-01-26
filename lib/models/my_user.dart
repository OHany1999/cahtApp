class MyUser {
  String id;
  String fName;
  String lName;
  String UserName;
  String Email;

  MyUser({required this.id, required this.fName, required this.lName, required this.UserName, required this.Email});


  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'fName':fName,
      'lName':lName,
      'UserName':UserName,
      'Email':Email,
    };
  }

  MyUser.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    fName: json['fName'],
    lName: json['lName'],
    UserName: json['UserName'],
    Email: json['Email'],
  );

}
