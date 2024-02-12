import 'external_id_model.dart';
import 'names_model.dart';
import 'rating_model.dart';
import 'votes_model.dart';
import 'poster_model.dart';
import 'backdrop_model.dart';
import 'genres_model.dart';
import 'countries_model.dart';
import 'persons_model.dart';
import 'budget_model.dart';
import 'fees_model.dart';
import 'sequels_and_prequels_model.dart';
import 'watchability_model.dart';
import 'facts_model.dart';
import 'similar_movies_model.dart';
import 'premiere_model.dart';
import 'audience_model.dart';
import 'logo_model.dart';
import 'videos_model.dart';

class DetailKinoModel {
  int? id;
  ExternalIdModel? externalId;
  String? name;
  String? alternativeName;
  dynamic enName;
  List<NamesModel>? names;
  String? type;
  int? typeNumber;
  int? year;
  String? description;
  String? shortDescription;
  String? slogan;
  dynamic status;
  RatingModel? rating;
  VotesModel? votes;
  int? movieLength;
  String? ratingMpaa;
  int? ageRating;
  PosterModel? poster;
  BackdropModel? backdrop;
  List<GenresModel>? genres;
  List<CountriesModel>? countries;
  List<PersonsModel>? persons;
  BudgetModel? budget;
  FeesModel? fees;
  List<SequelsAndPrequelsModel>? sequelsAndPrequels;
  WatchabilityModel? watchability;
  dynamic top10;
  dynamic top250;
  List<FactsModel>? facts;
  List<dynamic>? spokenLanguages;
  List<dynamic>? seasonsInfo;
  List<dynamic>? collections;
  List<dynamic>? productionCompanies;
  List<SimilarMoviesModel>? similarMovies;
  List<dynamic>? releaseYears;
  String? createdAt;
  String? updatedAt;
  PremiereModel? premiere;
  bool? ticketsOnSale;
  List<AudienceModel>? audience;
  bool? isSeries;
  dynamic seriesLength;
  dynamic totalSeriesLength;
  dynamic deletedAt;
  LogoModel? logo;
  List<String>? lists;
  dynamic networks;
  VideosModel? videos;

  DetailKinoModel(
      {this.id,
      this.externalId,
      this.name,
      this.alternativeName,
      this.enName,
      this.names,
      this.type,
      this.typeNumber,
      this.year,
      this.description,
      this.shortDescription,
      this.slogan,
      this.status,
      this.rating,
      this.votes,
      this.movieLength,
      this.ratingMpaa,
      this.ageRating,
      this.poster,
      this.backdrop,
      this.genres,
      this.countries,
      this.persons,
      this.budget,
      this.fees,
      this.sequelsAndPrequels,
      this.watchability,
      this.top10,
      this.top250,
      this.facts,
      this.spokenLanguages,
      this.seasonsInfo,
      this.collections,
      this.productionCompanies,
      this.similarMovies,
      this.releaseYears,
      this.createdAt,
      this.updatedAt,
      this.premiere,
      this.ticketsOnSale,
      this.audience,
      this.isSeries,
      this.seriesLength,
      this.totalSeriesLength,
      this.deletedAt,
      this.logo,
      this.lists,
      this.networks,
      this.videos});

  DetailKinoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    externalId = json['externalId'] != null
        ? ExternalIdModel?.fromJson(json['externalId'])
        : null;
    name = json['name'];
    alternativeName = json['alternativeName'];
    enName = json['enName'];
    if (json['names'] != null) {
      names = [];
      json['names'].forEach((v) {
        names!.add(NamesModel.fromJson(v));
      });
    }
    type = json['type'];
    typeNumber = json['typeNumber'];
    year = json['year'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    slogan = json['slogan'];
    status = json['status'];
    rating =
        json['rating'] != null ? RatingModel?.fromJson(json['rating']) : null;
    votes = json['votes'] != null ? VotesModel?.fromJson(json['votes']) : null;
    movieLength = json['movieLength'];
    ratingMpaa = json['ratingMpaa'];
    ageRating = json['ageRating'];
    poster =
        json['poster'] != null ? PosterModel?.fromJson(json['poster']) : null;
    backdrop = json['backdrop'] != null
        ? BackdropModel?.fromJson(json['backdrop'])
        : null;
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
    if (json['persons'] != null) {
      persons = [];
      json['persons'].forEach((v) {
        persons!.add(PersonsModel.fromJson(v));
      });
    }
    budget =
        json['budget'] != null ? BudgetModel?.fromJson(json['budget']) : null;
    fees = json['fees'] != null ? FeesModel?.fromJson(json['fees']) : null;
    if (json['sequelsAndPrequels'] != null) {
      sequelsAndPrequels = [];
      json['sequelsAndPrequels'].forEach((v) {
        sequelsAndPrequels!.add(SequelsAndPrequelsModel.fromJson(v));
      });
    }
    watchability = json['watchability'] != null
        ? WatchabilityModel?.fromJson(json['watchability'])
        : null;
    top10 = json['top10'];
    top250 = json['top250'];
    if (json['facts'] != null) {
      facts = [];
      json['facts'].forEach((v) {
        facts!.add(FactsModel.fromJson(v));
      });
    }
    if (json['spokenLanguages'] != null) {
      spokenLanguages = [];
      /*json['spokenLanguages'].forEach((v) {
        spokenLanguages!.add(dynamic.fromJson(v));
      });*/
    }
    if (json['seasonsInfo'] != null) {
      seasonsInfo = [];
      /*json['seasonsInfo'].forEach((v) {
        seasonsInfo!.add(dynamic.fromJson(v));
      });*/
    }
    if (json['collections'] != null) {
      collections = [];
      /*json['collections'].forEach((v) {
        collections!.add(dynamic.fromJson(v));
      });*/
    }
    if (json['productionCompanies'] != null) {
      productionCompanies = [];
     /* json['productionCompanies'].forEach((v) {
        productionCompanies!.add(dynamic.fromJson(v));
      });*/
    }
    if (json['similarMovies'] != null) {
      similarMovies = [];
      json['similarMovies'].forEach((v) {
        similarMovies!.add(SimilarMoviesModel.fromJson(v));
      });
    }
    if (json['releaseYears'] != null) {
      releaseYears = [];
      /*json['releaseYears'].forEach((v) {
        releaseYears!.add(dynamic.fromJson(v));
      });*/
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    premiere = json['premiere'] != null
        ? PremiereModel?.fromJson(json['premiere'])
        : null;
    ticketsOnSale = json['ticketsOnSale'];
    if (json['audience'] != null) {
      audience = [];
      json['audience'].forEach((v) {
        audience!.add(AudienceModel.fromJson(v));
      });
    }
    isSeries = json['isSeries'];
    seriesLength = json['seriesLength'];
    totalSeriesLength = json['totalSeriesLength'];
    deletedAt = json['deletedAt'];
    logo = json['logo'] != null ? LogoModel?.fromJson(json['logo']) : null;
    if (json['lists'] != null) {
      lists = [];
      json['lists'].forEach((v) {
        lists!.add(v);
      });
    }
    networks = json['networks'];
    videos =
        json['videos'] != null ? VideosModel?.fromJson(json['videos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    if (externalId != null) {
      json['externalId'] = externalId!.toJson();
    }
    json['name'] = name;
    json['alternativeName'] = alternativeName;
    json['enName'] = enName;
    if (names != null) {
      json['names'] = names!.map((v) => v.toJson()).toList();
    }
    json['type'] = type;
    json['typeNumber'] = typeNumber;
    json['year'] = year;
    json['description'] = description;
    json['shortDescription'] = shortDescription;
    json['slogan'] = slogan;
    json['status'] = status;
    if (rating != null) {
      json['rating'] = rating!.toJson();
    }
    if (votes != null) {
      json['votes'] = votes!.toJson();
    }
    json['movieLength'] = movieLength;
    json['ratingMpaa'] = ratingMpaa;
    json['ageRating'] = ageRating;
    if (poster != null) {
      json['poster'] = poster!.toJson();
    }
    if (backdrop != null) {
      json['backdrop'] = backdrop!.toJson();
    }
    if (genres != null) {
      json['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (countries != null) {
      json['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    if (persons != null) {
      json['persons'] = persons!.map((v) => v.toJson()).toList();
    }
    if (budget != null) {
      json['budget'] = budget!.toJson();
    }
    if (fees != null) {
      json['fees'] = fees!.toJson();
    }
    if (sequelsAndPrequels != null) {
      json['sequelsAndPrequels'] =
          sequelsAndPrequels!.map((v) => v.toJson()).toList();
    }
    if (watchability != null) {
      json['watchability'] = watchability!.toJson();
    }
    json['top10'] = top10;
    json['top250'] = top250;
    if (facts != null) {
      json['facts'] = facts!.map((v) => v.toJson()).toList();
    }
    if (spokenLanguages != null) {
      json['spokenLanguages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }
    if (seasonsInfo != null) {
      json['seasonsInfo'] = seasonsInfo!.map((v) => v.toJson()).toList();
    }
    if (collections != null) {
      json['collections'] = collections!.map((v) => v.toJson()).toList();
    }
    if (productionCompanies != null) {
      json['productionCompanies'] =
          productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (similarMovies != null) {
      json['similarMovies'] = similarMovies!.map((v) => v.toJson()).toList();
    }
    if (releaseYears != null) {
      json['releaseYears'] = releaseYears!.map((v) => v.toJson()).toList();
    }
    json['createdAt'] = createdAt;
    json['updatedAt'] = updatedAt;
    if (premiere != null) {
      json['premiere'] = premiere!.toJson();
    }
    json['ticketsOnSale'] = ticketsOnSale;
    if (audience != null) {
      json['audience'] = audience!.map((v) => v.toJson()).toList();
    }
    json['isSeries'] = isSeries;
    json['seriesLength'] = seriesLength;
    json['totalSeriesLength'] = totalSeriesLength;
    json['deletedAt'] = deletedAt;
    if (logo != null) {
      json['logo'] = logo!.toJson();
    }
    json['lists'] = lists;
    json['networks'] = networks;
    if (videos != null) {
      json['videos'] = videos!.toJson();
    }
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
