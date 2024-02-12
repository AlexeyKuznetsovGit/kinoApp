class PosterModel {
  dynamic url;
  dynamic previewUrl;

  PosterModel({this.url, this.previewUrl});

  PosterModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    previewUrl = json['previewUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['url'] = url;
    json['previewUrl'] = previewUrl;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
