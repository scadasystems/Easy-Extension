import 'dart:async';

/// Delay Handler
/// - [startDelayedTask] : Start Delayed Task
/// - [stopDelayedTask] : Stop Delayed Task
class Handler {
  Completer? _completer;
  bool _isStopped = false;

  Future<void> startDelayedTask(Duration duration, Function task) async {
    _completer = Completer<void>();
    _isStopped = false;

    Future.delayed(duration).then((_) {
      if (!_isStopped) {
        task();
      }

      _completer!.complete();
    });

    return _completer!.future;
  }

  void stopDelayedTask() {
    _isStopped = true;
  }
}
