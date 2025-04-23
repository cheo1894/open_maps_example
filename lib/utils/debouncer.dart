import 'dart:async';

class Debouncer<T> {
  final Duration delay;
  Timer? _timer;
  void Function(T)? _callback;

  Debouncer({required this.delay});

  void debounce(T value, void Function(T) callback) {
    _callback = callback;
    _timer?.cancel();
    _timer = Timer(delay, () {
      if (_callback != null) {
        _callback!(value);
      }
    });
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    cancel();
    _callback = null;
  }
}
