class UserData{
  String? name , email , token , image;
  int? id;
  UserData.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['api_token'];
    image = json['image'];
  }
}