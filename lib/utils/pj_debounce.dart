import 'dart:async';

class PjDebounce {
  late final int milliseconds;
  Timer? _timer;

  PjDebounce({required this.milliseconds});

  void run(Function() action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
