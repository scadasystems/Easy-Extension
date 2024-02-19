part of '../../easy_extension.dart';

extension DurationExtension on Duration {
  String toTimeString({bool hasSec = true}) {
    String timeString = toString().split('.').first.padLeft(8, '0');

    if (!hasSec) {
      return timeString.substring(0, 5);
    }

    return timeString;
  }
}
