part of '../../../easy_extension.dart';

/// A Flutter widget that provides an [AutoSizeGroup] to its builder function.
class AutoSizeGroupBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, AutoSizeGroup autoSizeGroup) builder;

  /// Creates an [AutoSizeGroupBuilder] widget.
  const AutoSizeGroupBuilder({super.key, required this.builder});

  @override
  State<AutoSizeGroupBuilder> createState() => _AutoSizeGroupBuilderState();
}

class _AutoSizeGroupBuilderState extends State<AutoSizeGroupBuilder> {
  final _group = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _group);
  }
}
