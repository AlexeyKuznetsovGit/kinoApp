part of 'cb_favourite_screen.dart';

@freezed
abstract class StFavouriteScreen with _$StFavouriteScreen{
  const factory StFavouriteScreen.init() = _Init;
  const factory StFavouriteScreen.hasInternet() = _HasInternet;
  const factory StFavouriteScreen.noInternet() = _NoInternet;
  const factory StFavouriteScreen.loading() = _Loading;
  const factory StFavouriteScreen.error(String? error, String? message) = _Error;
  const factory StFavouriteScreen.loaded() = _Loaded;
}