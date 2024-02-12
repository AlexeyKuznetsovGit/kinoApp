import 'logo_model.dart';

class ItemsModel {
  String? name;
  LogoModel? logo;
  String? url;

  ItemsModel({this.name, this.logo, this.url});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'] != null ? LogoModel?.fromJson(json['logo']) : null;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['name'] = name;
    if (logo != null) {
      json['logo'] = logo!.toJson();
    }
    json['url'] = url;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
