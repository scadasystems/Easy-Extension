part of '../../easy_extension.dart';

class StatefulWrapper extends StatefulWidget {
  final VoidCallback? onInit;
  final VoidCallback? onDispose;
  final Widget child;

  /// If you want use StatefulWidget's `initState()` or `dispose()`
  ///
  /// Just call [onInit] or [onDispose]
  const StatefulWrapper({
    super.key,
    this.onInit,
    this.onDispose,
    required this.child,
  });

  @override
  State<StatefulWrapper> createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    widget.onInit?.call();

    super.initState();
  }

  @override
  void dispose() {
    widget.onDispose?.call();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
