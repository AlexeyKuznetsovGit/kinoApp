import 'poster_model.dart';
import 'rating_model.dart';

class SequelsAndPrequelsModel {
  int? id;
  String? name;
  String? alternativeName;
  dynamic enName;
  String? type;
  PosterModel? poster;
  RatingModel? rating;
  int? year;

  SequelsAndPrequelsModel(
      {this.id,
      this.name,
      this.alternativeName,
      this.enName,
      this.type,
      this.poster,
      this.rating,
      this.year});

  SequelsAndPrequelsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeName = json['alternativeName'];
    enName = json['enName'];
    type = json['type'];
    poster =
        json['poster'] != null ? PosterModel?.fromJson(json['poster']) : null;
    rating =
        json['rating'] != null ? RatingModel?.fromJson(json['rating']) : null;
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['alternativeName'] = alternativeName;
    json['enName'] = enName;
    json['type'] = type;
    if (poster != null) {
      json['poster'] = poster!.toJson();
    }
    if (rating != null) {
      json['rating'] = rating!.toJson();
    }
    json['year'] = year;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
