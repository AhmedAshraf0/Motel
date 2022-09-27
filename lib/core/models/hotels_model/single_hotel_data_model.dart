import 'package:flutter/material.dart';
import 'package:motel/core/models/hotels_model/facilities_model.dart';
import 'package:motel/core/models/hotels_model/hotel_images_model.dart';

class SingleHotelDataModel {
  int? id;
  String? name,
      description,
      price,
      address,
      longitude,
      latitude,
      rate;
  List<HotelImagesModel> hotelImages = [];
  List<FacilitiesModel> facilities = [];
  SingleHotelDataModel.fromJson(Map<String , dynamic> json){
    List<dynamic>hotelsImages = json['hotel_images'];
    List<dynamic>hotelsFacilities = [];
    if(json['facilities'] != null){//it's API go and see
      hotelsFacilities = json['facilities'];
    }else{
      hotelsFacilities = json['hotel_facilities'];
    }
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    for(int i = 0 ; i < hotelsImages.length ; ++i){
      hotelImages.add(HotelImagesModel.fromJson(hotelsImages[i]));
    }
    for(int i = 0 ; i < hotelsFacilities.length ; ++i){
      facilities.add(FacilitiesModel.fromJson(hotelsFacilities[i]));
    }
  }
}
