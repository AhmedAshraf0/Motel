class FacilitiesModel{
  int? id;
  String? name , image;
  FacilitiesModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}