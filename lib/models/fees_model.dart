import 'world_model.dart';
import 'usa_model.dart';

class FeesModel {
  WorldModel? world;
  UsaModel? usa;

  FeesModel({this.world, this.usa});

  FeesModel.fromJson(Map<String, dynamic> json) {
    world = json['world'] != null ? WorldModel?.fromJson(json['world']) : null;
    usa = json['usa'] != null ? UsaModel?.fromJson(json['usa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (world != null) {
      json['world'] = world!.toJson();
    }
    if (usa != null) {
      json['usa'] = usa!.toJson();
    }
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
