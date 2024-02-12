class ExternalIdModel {
  String? imdb;
  int? tmdb;
  String? kpHD;

  ExternalIdModel({this.imdb, this.tmdb, this.kpHD});

  ExternalIdModel.fromJson(Map<String, dynamic> json) {
    imdb = json['imdb'];
    tmdb = json['tmdb'];
    kpHD = json['kpHD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['imdb'] = imdb;
    json['tmdb'] = tmdb;
    json['kpHD'] = kpHD;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
