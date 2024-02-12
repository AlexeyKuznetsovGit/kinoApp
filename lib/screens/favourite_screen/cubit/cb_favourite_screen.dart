import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kino_app/models/search_models/docs_model.dart';
import 'package:kino_app/repository/get_it.dart';
import 'package:kino_app/repository/kino_repository.dart';
import 'package:kino_app/utils/pj_utils.dart';
import 'package:kino_app/utils/singleton/sg_database.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';

part 'st_favourite_screen.dart';

part 'cb_favourite_screen.freezed.dart';

class CbFavouriteScreen extends Cubit<StFavouriteScreen> {
  late final StreamSubscription internetSubscription;
  final InternetConnectionChecker customInstance = InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1),
    checkInterval: const Duration(seconds: 1),
  );

  CbFavouriteScreen() : super(StFavouriteScreen.init()) {
    internetSubscription = customInstance.onStatusChange.listen((event) async {
      if (event == InternetConnectionStatus.connected) {
        SgAppData.instance.hasInternet = true;
        /*await getData();*/
        /*if (reload) {
          emit(StFavouriteScreen.init());

        }*/
        await getData();
        emit(StFavouriteScreen.hasInternet());
      } else {
        SgAppData.instance.hasInternet = false;
        await getData();
        emit(StFavouriteScreen.noInternet());
      }
    });
  }

  bool reload = false;

  @override
  Future<void> close() {
    internetSubscription.cancel();
    return super.close();
  }

  Future<void> removeKino(String id) async {
    try {
      emit(StFavouriteScreen.loading());
      await getIt<KinoRepository>().removeKino(id: id);
      SgAppData.instance.fullData.removeWhere((element) => element.id.toString() == id);
      // await getData();
      emit(StFavouriteScreen.loaded());
    } on FirebaseException catch (e) {
      emit(StFavouriteScreen.error(e.code, PjUtils.textError));
    }
  }

  Future<void> databaseRemoveKino(int id, int index) async {
    await DBProvider.db.deleteKino(id);
    SgAppData.instance.localData.removeAt(index);

  }

  Future<void> getData() async {
    try {
      emit(StFavouriteScreen.init());
      if (SgAppData.instance.hasInternet) {
        SgAppData.instance.fullData = await (getIt<KinoRepository>().getFavouritesKino());
        List<Map<String, dynamic>> localData = await DBProvider.db.getAllKinos();
        if (localData.isNotEmpty) {
          for (Map<String, dynamic> localElement in localData) {
            if (SgAppData.instance.fullData.isNotEmpty) {
              List<DocsModel> temp = [];
              int id = localElement['id'];
              if (!SgAppData.instance.fullData.any((element) => element.id == id)) {
                log(localElement['id'].toString(), name: 'localElement');
                temp.add(DocsModel.fromJson(localElement));
                await getIt<KinoRepository>().addKino(
                    id: localElement['id'],
                    name: localElement['name'],
                    shortDescription: localElement['shortDescription'],
                    ratingImb: localElement['ratingImb']);
              }

              /*if (SgAppData.instance.fullData.contains(localElement['id'])) {
                log(localElement['id'].toString(), name: 'localElement');
                temp.add(DocsModel.fromJson(localElement));
                await getIt<KinoRepository>().addKino(
                    id: localElement['id'],
                    name: localElement['name'],
                    shortDescription: localElement['shortDescription'],
                    ratingImb: localElement['ratingImb']);
              }*/
              SgAppData.instance.fullData.addAll(temp);
            } else {
              SgAppData.instance.fullData.add(DocsModel.fromJson(localElement));
              await getIt<KinoRepository>().addKino(
                  id: localElement['id'],
                  name: localElement['name'],
                  shortDescription: localElement['shortDescription'],
                  ratingImb: localElement['ratingImb']);
            }
          }
        }
      } else {
        List<Map<String, dynamic>> localData = await DBProvider.db.getAllKinos();
        if (localData.isNotEmpty) {
          for (Map<String, dynamic> localElement in localData) {
            int id = localElement['id'];
            if (!SgAppData.instance.localData.any((element) => element.id == id)) {
              SgAppData.instance.localData.add(DocsModel.fromJson(localElement));
            }
            /*if (SgAppData.instance.localData.contains(localElement['id'])) {
              SgAppData.instance.localData.add(DocsModel.fromJson(localElement));
            }*/
          }
        }
      }
      log(SgAppData.instance.localData.toString(), name: 'local');
      log(SgAppData.instance.fullData.toString(), name: 'full');
    } on FirebaseException catch (e) {
      emit(StFavouriteScreen.error(e.code, PjUtils.textError));
    }
  }
}
