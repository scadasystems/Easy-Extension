part of '../../easy_extension.dart';

extension SizedboxExtension on num {
  Widget get widthBox => SizedBox(width: toDouble());
  Widget get heightBox => SizedBox(height: toDouble());
}

extension GapExtension on num {
  Widget get gap => const Gap(20);
  Widget get gapSliver => const SliverGap(20);
}
