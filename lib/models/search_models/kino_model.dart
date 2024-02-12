

import 'package:kino_app/models/search_models/docs_model.dart';

class KinoModel {
  List<DocsModel>? docs;
  int? total;
  int? limit;
  int? page;
  int? pages;

  KinoModel({this.docs, this.total, this.limit, this.page, this.pages});

  KinoModel.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = [];
      json['docs'].forEach((v) {
        docs!.add(DocsModel.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (docs != null) {
      json['docs'] = docs!.map((v) => v.toJson()).toList();
    }
    json['total'] = total;
    json['limit'] = limit;
    json['page'] = page;
    json['pages'] = pages;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
