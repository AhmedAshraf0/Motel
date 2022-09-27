import 'package:motel/core/models/global_models/status_model.dart';
import 'package:motel/core/models/global_models/userData_model.dart';

class UpdateProfileModel{
  ResponseStatus? status;
  UserData? data;
  UpdateProfileModel.fromJson(Map<String , dynamic>json){
    status = ResponseStatus.fromJson(json['status']);
    data = UserData.fromJson(json['data']);
  }
}