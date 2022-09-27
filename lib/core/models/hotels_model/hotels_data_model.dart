import 'package:flutter/material.dart';
import 'package:motel/core/models/hotels_model/links_model.dart';

import 'single_hotel_data_model.dart';

class HotelsDataModel{
  int? currentPage , from , lastPage , to , total;
  List<SingleHotelDataModel> hotels = [];
  String? firstPageUrl , lastPageUrl , nextPageUrl;
  List<LinksModel> links = [];

  HotelsDataModel.fromJson(Map<String,dynamic>json){
    List<dynamic> data = json['data'];
    List<dynamic> linkss = json['links'];
    currentPage = json['current_page'];
    for(int i = 0 ; i < data.length ; ++i){
      hotels.add(SingleHotelDataModel.fromJson(data[i]));
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPageUrl = json['last_page_url'];
    lastPage = json['last_page'];
    for(int i = 0 ; i < linkss.length ; ++i){
      links.add(LinksModel.fromJson(linkss[i]));
    }
    nextPageUrl = json['next_page_url'];
    to = json['to'];
    total = json['total'];
  }
}