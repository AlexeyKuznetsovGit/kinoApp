

import 'package:kino_app/models/search_models/backdrop_model.dart';
import 'package:kino_app/models/search_models/countries_model.dart';
import 'package:kino_app/models/search_models/external_id_model.dart';
import 'package:kino_app/models/search_models/genres_model.dart';
import 'package:kino_app/models/search_models/logo_model.dart';
import 'package:kino_app/models/search_models/names_model.dart';
import 'package:kino_app/models/search_models/poster_model.dart';
import 'package:kino_app/models/search_models/rating_model.dart';
import 'package:kino_app/models/search_models/release_years_model.dart';
import 'package:kino_app/models/search_models/votes_model.dart';

class DocsModel {
  int? id;
  String? name;
  String? alternativeName;
  String? enName;
  String? type;
  int? year;
  String? description;
  String? shortDescription;
  int? movieLength;
  bool? isSeries;
  bool? ticketsOnSale;
  dynamic totalSeriesLength;
  int? seriesLength;
  dynamic ratingMpaa;
  dynamic ageRating;
  dynamic top10;
  dynamic top250;
  int? typeNumber;
  dynamic status;
  List<NamesModel>? names;
  ExternalIdModel? externalId;
  LogoModel? logo;
  PosterModel? poster;
  BackdropModel? backdrop;
  RatingModel? rating;
  String? ratingImb;
  VotesModel? votes;
  List<GenresModel>? genres;
  List<CountriesModel>? countries;
  List<ReleaseYearsModel>? releaseYears;

  DocsModel(
      {this.id,
      this.name,
      this.alternativeName,
      this.enName,
      this.type,
      this.year,
      this.description,
      this.shortDescription,
      this.movieLength,
      this.isSeries,
      this.ticketsOnSale,
      this.totalSeriesLength,
      this.seriesLength,
      this.ratingMpaa,
      this.ageRating,
      this.top10,
      this.top250,
      this.typeNumber,
      this.status,
      this.names,
      this.externalId,
      this.logo,
      this.poster,
      this.backdrop,
      this.rating,
      this.ratingImb,
      this.votes,
      this.genres,
      this.countries,
      this.releaseYears});

  DocsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeName = json['alternativeName'];
    enName = json['enName'];
    type = json['type'];
    year = json['year'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    movieLength = json['movieLength'];
    isSeries = json['isSeries'];
    ticketsOnSale = json['ticketsOnSale'];
    totalSeriesLength = json['totalSeriesLength'];
    seriesLength = json['seriesLength'];
    ratingMpaa = json['ratingMpaa'];
    ageRating = json['ageRating'];
    top10 = json['top10'];
    top250 = json['top250'];
    typeNumber = json['typeNumber'];
    status = json['status'];
    ratingImb = json['ratingImb'] ?? '1.0';
    if (json['names'] != null) {
      names = [];
      json['names'].forEach((v) {
        names!.add(NamesModel.fromJson(v));
      });
    }
    externalId = json['externalId'] != null ? ExternalIdModel?.fromJson(json['externalId']) : null;
    logo = json['logo'] != null ? LogoModel?.fromJson(json['logo']) : null;
    poster = json['poster'] != null ? PosterModel?.fromJson(json['poster']) : null;
    backdrop = json['backdrop'] != null ? BackdropModel?.fromJson(json['backdrop']) : null;
    rating = json['rating'] != null ? RatingModel?.fromJson(json['rating']) : null;
    votes = json['votes'] != null ? VotesModel?.fromJson(json['votes']) : null;
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres!.add(GenresModel.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = [];
      json['countries'].forEach((v) {
        countries!.add(CountriesModel.fromJson(v));
      });
    }
    if (json['releaseYears'] != null) {
      releaseYears = [];
      json['releaseYears'].forEach((v) {
        releaseYears!.add(ReleaseYearsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['alternativeName'] = alternativeName;
    json['enName'] = enName;
    json['type'] = type;
    json['year'] = year;
    json['description'] = description;
    json['shortDescription'] = shortDescription;
    json['movieLength'] = movieLength;
    json['isSeries'] = isSeries;
    json['ticketsOnSale'] = ticketsOnSale;
    json['totalSeriesLength'] = totalSeriesLength;
    json['seriesLength'] = seriesLength;
    json['ratingMpaa'] = ratingMpaa;
    json['ageRating'] = ageRating;
    json['top10'] = top10;
    json['top250'] = top250;
    json['typeNumber'] = typeNumber;
    json['status'] = status;
    if (names != null) {
      json['names'] = names!.map((v) => v.toJson()).toList();
    }
    if (externalId != null) {
      json['externalId'] = externalId!.toJson();
    }
    if (logo != null) {
      json['logo'] = logo!.toJson();
    }
    if (poster != null) {
      json['poster'] = poster!.toJson();
    }
    if (backdrop != null) {
      json['backdrop'] = backdrop!.toJson();
    }
    if (rating != null) {
      json['rating'] = rating!.toJson();
    }
    if (votes != null) {
      json['votes'] = votes!.toJson();
    }
    if (genres != null) {
      json['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (countries != null) {
      json['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    if (releaseYears != null) {
      json['releaseYears'] = releaseYears!.map((v) => v.toJson()).toList();
    }
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
