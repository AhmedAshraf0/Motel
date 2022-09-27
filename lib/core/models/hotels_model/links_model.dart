class LinksModel{
  String? url , label;
  bool? active;
  LinksModel.fromJson(Map<String,dynamic>json){
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}