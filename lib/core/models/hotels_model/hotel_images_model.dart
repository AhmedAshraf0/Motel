class HotelImagesModel{
  int? id;
  String? hotelId , image;
  HotelImagesModel.fromJson(Map<String , dynamic>json){
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
  }
}