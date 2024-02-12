class LogoModel {
  dynamic url;

  LogoModel({this.url});

  LogoModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['url'] = url;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
