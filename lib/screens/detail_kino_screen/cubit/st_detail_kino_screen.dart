part of 'cb_detail_kino_screen.dart';

@freezed
abstract class StDetailKinoScreen with _$StDetailKinoScreen{
  const factory StDetailKinoScreen.init() = _Init;
  const factory StDetailKinoScreen.loading() = _Loading;
  const factory StDetailKinoScreen.error(String? error, String? message) = _Error;
  const factory StDetailKinoScreen.loaded(DetailKinoModel detailKino) = _Loaded;
}