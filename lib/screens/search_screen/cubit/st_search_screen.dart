part of 'cb_search_screen.dart';

@freezed
abstract class StSearchScreen with _$StSearchScreen {
  const factory StSearchScreen.hasInternet() = _HasInternet;
  const factory StSearchScreen.noInternet() = _NoInternet;
  const factory StSearchScreen.loading() = _Loading;
  const factory StSearchScreen.error(String? error, String? message) = _Error;
  const factory StSearchScreen.loaded() = _Loaded;
}