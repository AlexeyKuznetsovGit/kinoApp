class TrailersModel {
  String? url;
  String? name;
  String? site;
  String? type;

  TrailersModel({this.url, this.name, this.site, this.type});

  TrailersModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    site = json['site'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['url'] = url;
    json['name'] = name;
    json['site'] = site;
    json['type'] = type;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
