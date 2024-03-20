part of '../../easy_extension.dart';

extension SizedboxExtension on num {
  Widget get widthBox => SizedBox(width: toDouble());
  Widget get heightBox => SizedBox(height: toDouble());
}

extension GapExtension on num {
  Widget get gap => Gap(toDouble());
  Widget get sliverGap => SliverGap(toDouble());
}

extension InlineSpanExtension on num {
  WidgetSpan get widthSpan => WidgetSpan(child: SizedBox(width: toDouble()));
  WidgetSpan get heightSpan => WidgetSpan(child: SizedBox(height: toDouble()));
}
