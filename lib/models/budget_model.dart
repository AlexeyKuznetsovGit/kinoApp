class BudgetModel {
  int? value;
  String? currency;

  BudgetModel({this.value, this.currency});

  BudgetModel.fromJson(Map<String, dynamic> json) {
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
