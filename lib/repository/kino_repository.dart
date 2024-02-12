import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticon_api/eticon_api.dart';
import 'package:kino_app/models/detail_kino_model.dart';
import 'package:kino_app/models/search_models/docs_model.dart';
import 'package:kino_app/models/search_models/kino_model.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';

class KinoRepository {
  Future<List<DocsModel>> searchKino(String name) async {
    List<DocsModel> result = [];
    Map<String, dynamic> response = await Api.get('search',
        headers: {
          'X-API-KEY': 'YH1T202-1G54T24-KKH2X7X-HXNXBEP',
        },
        urlIndex: 0,
        testMode: true,
        isAuth: false,
        query: {'page': 1, 'limit': 10, 'query': name});
    if (KinoModel.fromJson(response).docs != null) {
      for (DocsModel elm in KinoModel.fromJson(response).docs!) {
        elm.ratingImb = elm.rating?.imdb.toString() ?? '1.0';
        result.add(elm);
      }
    }
    return result;
  }

  Future<DetailKinoModel> getKino(int id) async {
    Map<String, dynamic> response = await Api.get('$id',
        headers: {
          'X-API-KEY': 'YH1T202-1G54T24-KKH2X7X-HXNXBEP',
        },
        urlIndex: 0,
        testMode: true,
        isAuth: false,
        );

    return DetailKinoModel.fromJson(response);
  }

  Future<void> addKino(
      {required int id, required String name, required String shortDescription, required String ratingImb}) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(SgAppData.instance.userId)
        .collection('kinos')
        .doc(id.toString())
        .set({'id': id, 'name': name, 'shortDescription': shortDescription, "ratingImb": ratingImb});
    /* await FirebaseFirestore.instance
        .collection('kinos')
        .doc(id.toString())
        .set({'id': id, 'name': name, 'shortDescription': shortDescription, "ratingImb": ratingImb});*/
  }

  Future<void> removeKino({required String id}) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(SgAppData.instance.userId)
        .collection('kinos')
        .doc(id.toString())
        .delete();
    /* await FirebaseFirestore.instance.collection('kinos').doc(id).delete();*/
  }

  Future<List<DocsModel>> getFavouritesKino() async {
    Map<String, dynamic> response = {};
    List<DocsModel> result = [];
    await FirebaseFirestore.instance.collection('user').doc(SgAppData.instance.userId).collection('kinos').get().then(
      (value) {
        for (var docSnapshot in value.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');

          response = docSnapshot.data();
          result.add(DocsModel.fromJson(response));
          /*for (DocsModel elm in result) {
          if (elm.rating != null) {
            elm.ratingImb = elm.rating!.imdb?.toString() ?? '1.0';
          }
        }*/
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
   /* await FirebaseFirestore.instance.collection("kinos").get().then(
      (value) {
        for (var docSnapshot in value.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');

          response = docSnapshot.data();
          result.add(DocsModel.fromJson(response));
        }

        log(result.toString(), name: 'result');
      },
      onError: (e) => print("Error completing: $e"),
    );*/
    return result;
  }
}
