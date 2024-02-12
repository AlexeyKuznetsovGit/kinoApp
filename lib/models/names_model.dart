class NamesModel {
  String? name;
  String? language;
  String? type;

  NamesModel({this.name, this.language, this.type});

  NamesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['name'] = name;
    json['language'] = language;
    json['type'] = type;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
