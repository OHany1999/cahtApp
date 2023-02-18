class RoomCategory{
  late String name;
  late String image;
  RoomCategory(this.name,this.image);

  static List<RoomCategory> getCategories(){
    return [
      RoomCategory('sports', 'assets/images/sports.png'),
      RoomCategory('movies', 'assets/images/movies.png'),
      RoomCategory('music', 'assets/images/music.png'),
    ];
  }
}