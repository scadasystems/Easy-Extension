part of easy_extension;

extension ScrollControllerExtension on ScrollController {
  void scrollToTop({
    bool animate = false,
    Duration? duration,
    Curve curve = Curves.ease,
  }) {
    if (!hasClients) return;

    if (animate) {
      animateTo(
        0,
        duration: duration ?? 300.toMillisecond,
        curve: curve,
      );
    } else {
      jumpTo(0);
    }
  }

  void scrollToBottom({
    bool animate = false,
    Duration? duration,
    Curve curve = Curves.ease,
    double offset = 0,
  }) {
    if (!hasClients) return;

    if (animate) {
      animateTo(
        position.maxScrollExtent + offset,
        duration: duration ?? 300.toMillisecond,
        curve: curve,
      );
    } else {
      jumpTo(position.maxScrollExtent + offset);
    }
  }
}
