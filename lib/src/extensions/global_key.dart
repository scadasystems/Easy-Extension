part of '../../easy_extension.dart';

extension GlobalKeyExtension on GlobalKey {
  /// Get widget render box
  RenderBox? get renderBox => currentContext?.findRenderObject() as RenderBox?;

  /// Get widget size
  Size get size => renderBox?.size ?? Size.zero;

  /// Get widget position
  Offset get position => renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
}
