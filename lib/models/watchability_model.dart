import 'items_model.dart';

class WatchabilityModel {
  List<ItemsModel>? items;

  WatchabilityModel({this.items});

  WatchabilityModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(ItemsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (items != null) {
      json['items'] = items!.map((v) => v.toJson()).toList();
    }
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
