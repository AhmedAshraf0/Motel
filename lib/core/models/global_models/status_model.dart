class ResponseStatus{
  String? type , enMsg , arMsg;
  ResponseStatus.fromJson(Map<String , dynamic> json){
    type = json['type'];
    if(json['title'] != null){
      enMsg = json['title']['en'];
      arMsg = json['title']['ar'];
    }
  }
}