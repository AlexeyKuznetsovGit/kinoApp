class RatingModel {
  dynamic kp;
  dynamic imdb;
  dynamic filmCritics;
  dynamic russianFilmCritics;
  dynamic await_;

  RatingModel(
      {this.kp,
      this.imdb,
      this.filmCritics,
      this.russianFilmCritics,
      this.await_});

  RatingModel.fromJson(Map<String, dynamic> json) {
    kp = json['kp'];
    imdb = json['imdb'];
    filmCritics = json['filmCritics'];
    russianFilmCritics = json['russianFilmCritics'];
    await_ = json['await'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['kp'] = kp;
    json['imdb'] = imdb;
    json['filmCritics'] = filmCritics;
    json['russianFilmCritics'] = russianFilmCritics;
    json['await'] = await_;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
