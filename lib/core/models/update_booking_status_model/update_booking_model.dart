import 'package:motel/core/models/global_models/status_model.dart';

class UpdateBooking{
  ResponseStatus? status;
  UpdateBooking.fromJson(Map<String,dynamic>json){
    status = ResponseStatus.fromJson(json['status']);
  }
}