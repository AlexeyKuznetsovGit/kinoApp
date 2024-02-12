import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kino_app/models/search_models/docs_model.dart';
import 'package:kino_app/repository/get_it.dart';
import 'package:kino_app/repository/kino_repository.dart';
import 'package:kino_app/utils/pj_utils.dart';
import 'package:kino_app/utils/singleton/sg_database.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';
import 'package:uuid/uuid.dart';

part 'st_main_screen.dart';

part 'cb_main_screen.freezed.dart';

class CbMainScreen extends Cubit<StMainScreen> {
  CbMainScreen() : super(const StMainScreen.loading());

  Future<void> getData() async {
    try {
      final box = GetStorage();
      if (box.read('user') != null) {
        SgAppData.instance.userId = box.read('user');
      } else {
        var uuid = Uuid();
        box.write('user', uuid.v1());
        SgAppData.instance.userId = box.read('user');
      }
      if (SgAppData.instance.hasInternet) {
        SgAppData.instance.fullData = await (getIt<KinoRepository>().getFavouritesKino());
        List<Map<String, dynamic>> localData = await DBProvider.db.getAllKinos();
        if (localData.isNotEmpty) {
          for (Map<String, dynamic> localElement in localData) {
            if (SgAppData.instance.fullData.isNotEmpty) {
              List<DocsModel> temp = [];
              int id = localElement['id'];
              if(!SgAppData.instance.fullData.any((element) =>element.id ==id)){
                log(localElement['id'].toString(), name: 'localElement');
                temp.add(DocsModel.fromJson(localElement));
                await getIt<KinoRepository>().addKino(
                    id: localElement['id'],
                    name: localElement['name'],
                    shortDescription: localElement['shortDescription'],
                    ratingImb: localElement['ratingImb']);
              }
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
            SgAppData.instance.localData.add(DocsModel.fromJson(localElement));
          }
        }
      }

      emit(StMainScreen.loaded());
    } on FirebaseException catch (e) {
      emit(StMainScreen.error(e.code, PjUtils.textError));
    }
  }
}
