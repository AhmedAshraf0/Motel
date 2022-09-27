import 'package:flutter/material.dart';
import 'package:motel/core/models/global_models/status_model.dart';

class CreateBooking{
  ResponseStatus? status;
  CreateBooking.fromJson(Map<String , dynamic>json){
    status = ResponseStatus.fromJson(json['status']);
  }
}