part of easy_extension;

extension DurationExtension on num {
  Duration get toMicrosecond => Duration(microseconds: round());
  Duration get toMillisecond => (this * 1000).toMicrosecond;
  Duration get toSecond => (this * 1000 * 1000).toMicrosecond;
  Duration get toMinute => (this * 1000 * 1000 * 60).toMicrosecond;
  Duration get toHour => (this * 1000 * 1000 * 60 * 60).toMicrosecond;
  Duration get toDay => (this * 1000 * 1000 * 60 * 60 * 24).toMicrosecond;
}
