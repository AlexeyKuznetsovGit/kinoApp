class UsaModel {
  int? value;
  String? currency;

  UsaModel({this.value, this.currency});

  UsaModel.fromJson(Map<String, dynamic> json) {
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
