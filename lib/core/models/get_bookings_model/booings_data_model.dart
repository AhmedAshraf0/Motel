import 'package:motel/core/models/global_models/userData_model.dart';
import 'package:motel/core/models/hotels_model/single_hotel_data_model.dart';

class BookingsDataClass{
  int? id;
  String? userId , hotelId , type;
  UserData? userData;
  SingleHotelDataModel? hotelDataModel;
  BookingsDataClass.fromJson(Map<String,dynamic>json){
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    type = json['type'];
    userData = UserData.fromJson(json['user']);
    hotelDataModel = SingleHotelDataModel.fromJson(json['hotel']);
  }
}