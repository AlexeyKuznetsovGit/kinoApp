

import 'package:kino_app/models/search_models/docs_model.dart';

class SgAppData {
  SgAppData._();

  static SgAppData instance = SgAppData._();
  static bool _hasInternet = true;
  static String _userId = '';
  static List<DocsModel> _fullData = [];
  static List<DocsModel> _localData = [];

  set userId(String v) => _userId = v;

  String get userId => _userId;

  set hasInternet(bool v) => _hasInternet = v;

  bool get hasInternet => _hasInternet;

  List<DocsModel> get fullData => _fullData;

  set fullData(List<DocsModel> v) => _fullData = v;

  List<DocsModel> get localData => _localData;

  set localData(List<DocsModel> v) => _localData = v;
}
