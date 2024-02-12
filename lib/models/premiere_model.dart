class PremiereModel {
  String? world;
  String? russia;
  String? bluray;
  String? dvd;

  PremiereModel({this.world, this.russia, this.bluray, this.dvd});

  PremiereModel.fromJson(Map<String, dynamic> json) {
    world = json['world'];
    russia = json['russia'];
    bluray = json['bluray'];
    dvd = json['dvd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['world'] = world;
    json['russia'] = russia;
    json['bluray'] = bluray;
    json['dvd'] = dvd;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
