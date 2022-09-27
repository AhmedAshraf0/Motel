
import 'package:motel/core/models/get_bookings_model/booings_data_model.dart';
import 'package:motel/core/models/global_models/status_model.dart';
import 'package:motel/core/models/hotels_model/links_model.dart';

class GetBookingModel{
  ResponseStatus? status;
  int? currentPage , from , lastPaga , to , total;
  List<BookingsDataClass> data = [];
  String? firstPageUrl , lastPageUrl , nextPageUrl;
  List<LinksModel> links = [];
  GetBookingModel.fromJson(Map<String,dynamic>json){
    List<dynamic> hotelsData = json['data']['data'];
    List<dynamic> hotelsLinks = json['data']['links'];
    status = ResponseStatus.fromJson(json['status']);
    currentPage = json['data']['current_page'];
    for(int i = 0 ; i < hotelsData.length ; ++i){
      data.add(BookingsDataClass.fromJson(hotelsData[i]));
    }
    firstPageUrl = json['data']['first_page-url'];
    from = json['data']['from'];
    lastPaga = json['data']['last_page'];
    lastPageUrl = json['data']['last_page_url'];
    for(int i = 0 ; i < hotelsLinks.length ; ++i){
      links.add(LinksModel.fromJson(hotelsLinks[i]));
    }
    nextPageUrl = json['data']['next_page_url'];
    to = json['data']['to'];
    total = json['data']['total'];
  }
}