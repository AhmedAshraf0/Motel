import 'package:motel/core/models/facilities_model/facilites_data_model.dart';
import 'package:motel/core/models/global_models/status_model.dart';

class FacilitiesSearchModel{
  ResponseStatus? status;
  List<FacilitiesDataModel>? data = [];
  FacilitiesSearchModel.fromJson(Map<String , dynamic>json){
    status = ResponseStatus.fromJson(json['status']);
    List<dynamic> facilitiesJsonModel = json['data'];
    for(int i = 0 ; i < facilitiesJsonModel.length ; ++i){
      data!.add(FacilitiesDataModel.fromJson(facilitiesJsonModel[i]));
    }
  }
}