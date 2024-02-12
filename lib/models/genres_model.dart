class GenresModel {
  String? name;

  GenresModel({this.name});

  GenresModel.fromJson(Map<String, dynamic> json) {
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
