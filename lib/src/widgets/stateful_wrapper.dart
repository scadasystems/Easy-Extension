part of easy_extension;

class StatefulWrapper extends StatefulWidget {
  final VoidCallback? onInit;
  final Widget child;

  /// If you want use `StatefulWidget's initState()`
  ///
  /// Just call [onInit]
  const StatefulWrapper({
    Key? key,
    this.onInit,
    required this.child,
  }) : super(key: key);

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
  Widget build(BuildContext context) {
    return widget.child;
  }
}
