class FacilitiesDataModel{
  int? id;
  String? name , image;
  FacilitiesDataModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}