import 'package:flutter/material.dart';
import 'package:motel/core/models/global_models/status_model.dart';
import 'package:motel/core/models/hotels_model/hotels_data_model.dart';

class HotelsModel{
  ResponseStatus? status;
  HotelsDataModel? hotelsDataModel;
  HotelsModel.fromJson(Map<String,dynamic>json){
    status = ResponseStatus.fromJson(json['status']);
    // debugPrint('STATUS' + status!.type.toString());
    hotelsDataModel = HotelsDataModel.fromJson(json['data']);
  }
}