import 'trailers_model.dart';

class VideosModel {
  List<TrailersModel>? trailers;

  VideosModel({this.trailers});

  VideosModel.fromJson(Map<String, dynamic> json) {
    if (json['trailers'] != null) {
      trailers = [];
      json['trailers'].forEach((v) {
        trailers!.add(TrailersModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (trailers != null) {
      json['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
