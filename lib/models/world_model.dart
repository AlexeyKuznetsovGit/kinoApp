class WorldModel {
  int? value;
  String? currency;

  WorldModel({this.value, this.currency});

  WorldModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['value'] = value;
    json['currency'] = currency;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
