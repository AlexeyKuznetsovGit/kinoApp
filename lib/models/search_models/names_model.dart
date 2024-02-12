class NamesModel {
  String? name;

  NamesModel({this.name});

  NamesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['name'] = name;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
