class ExternalIdModel {
  dynamic kpHD;

  ExternalIdModel({this.kpHD});

  ExternalIdModel.fromJson(Map<String, dynamic> json) {
    kpHD = json['kpHD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['kpHD'] = kpHD;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
