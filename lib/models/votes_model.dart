class VotesModel {
  int? kp;
  int? imdb;
  int? filmCritics;
  int? russianFilmCritics;
  int? await_;

  VotesModel(
      {this.kp,
      this.imdb,
      this.filmCritics,
      this.russianFilmCritics,
      this.await_});

  VotesModel.fromJson(Map<String, dynamic> json) {
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
