class ReleaseYearsModel {
  int? start;
  dynamic end;

  ReleaseYearsModel({this.start, this.end});

  ReleaseYearsModel.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['start'] = start;
    json['end'] = end;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
