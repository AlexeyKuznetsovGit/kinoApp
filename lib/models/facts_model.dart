class FactsModel {
  String? value;
  String? type;
  bool? spoiler;

  FactsModel({this.value, this.type, this.spoiler});

  FactsModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    type = json['type'];
    spoiler = json['spoiler'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['value'] = value;
    json['type'] = type;
    json['spoiler'] = spoiler;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
