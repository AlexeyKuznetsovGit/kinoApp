import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eticon_api/eticon_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kino_app/models/search_models/docs_model.dart';
import 'package:kino_app/repository/get_it.dart';
import 'package:kino_app/repository/kino_repository.dart';
import 'package:kino_app/utils/pj_utils.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';

part 'st_search_screen.dart';

part 'cb_search_screen.freezed.dart';

class CbSearchScreen extends Cubit<StSearchScreen> {
  late final StreamSubscription internetSubscription;
  final InternetConnectionChecker customInstance = InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1),
    checkInterval: const Duration(seconds: 1),
  );

  CbSearchScreen()
      : super(SgAppData.instance.hasInternet ? StSearchScreen.hasInternet() : StSearchScreen.noInternet()) {
    internetSubscription = customInstance.onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.connected) {
        SgAppData.instance.hasInternet = true;
        emit(StSearchScreen.hasInternet());
      } else {
        SgAppData.instance.hasInternet = false;
        emit(StSearchScreen.noInternet());
      }
    });
  }

  @override
  Future<void> close() {
    internetSubscription.cancel();
    return super.close();
  }

  List<DocsModel> data = [];

  Future<void> removeKino(String id) async {
    try {
      emit(StSearchScreen.hasInternet());
      await getIt<KinoRepository>().removeKino(id: id);
      SgAppData.instance.fullData.removeWhere((element) => element.id.toString() == id);
      emit(StSearchScreen.loaded());
    } on FirebaseException catch (e) {
      emit(StSearchScreen.error(e.code, PjUtils.textError));
    }
  }

  Future<void> addKino(int id, String name, String shortDescription, String ratingImb) async {
    try {
      emit(StSearchScreen.hasInternet());
      await getIt<KinoRepository>()
          .addKino(id: id, name: name, shortDescription: shortDescription, ratingImb: ratingImb);
      SgAppData.instance.fullData
          .add(DocsModel(id: id, name: name, shortDescription: shortDescription, ratingImb: ratingImb));
      emit(StSearchScreen.loaded());
    } on FirebaseException catch (e) {
      emit(StSearchScreen.error(e.code, PjUtils.textError));
    }
  }

  Future<void> getData(String name) async {
    try {
      emit(StSearchScreen.loading());
      data = await (getIt<KinoRepository>().searchKino(name));
      /*if(data.isNotEmpty){
        for(DocsModel elm in data){
          elm.id.
        }
      }*/
      emit(StSearchScreen.loaded());
    } on APIException catch (e) {
      emit(StSearchScreen.error(e.code.toString(), PjUtils.textError));
    }
  }
}
