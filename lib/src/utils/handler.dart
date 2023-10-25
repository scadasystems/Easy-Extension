import 'dart:async';

/// 딜레이 핸들러
/// - [startDelayedTask] : 딜레이 태스크 시작
/// - [stopDelayedTask] : 딜레이 태스크 중지
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
