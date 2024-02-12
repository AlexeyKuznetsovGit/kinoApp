import 'dart:async';

import 'package:eticon_api/eticon_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kino_app/models/detail_kino_model.dart';
import 'package:kino_app/repository/get_it.dart';
import 'package:kino_app/repository/kino_repository.dart';
import 'package:kino_app/utils/pj_utils.dart';

part 'st_detail_kino_screen.dart';

part 'cb_detail_kino_screen.freezed.dart';

class CbDetailKinoScreen extends Cubit<StDetailKinoScreen> {
  CbDetailKinoScreen() : super(StDetailKinoScreen.init());

  DetailKinoModel detailKino = DetailKinoModel();
  String urlVideo = '';
  Future<void> getData(int id) async {
    try {
      detailKino = await (getIt<KinoRepository>().getKino(id));

      emit(StDetailKinoScreen.loaded(detailKino));
    } on APIException catch (e) {
      emit(StDetailKinoScreen.error(e.code.toString(), PjUtils.textError));
    }
  }
}
