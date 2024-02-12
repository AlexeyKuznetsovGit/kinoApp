class AudienceModel {
  int? count;
  String? country;

  AudienceModel({this.count, this.country});

  AudienceModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['count'] = count;
    json['country'] = country;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
