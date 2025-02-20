part of '../../easy_extension.dart';

extension TimeOfDayExtension on TimeOfDay {
  /// HH:mm
  String toFormat({bool second = false}) {
    final hourFormat = hour.toString().padLeft(2, '0');
    final minuteFormat = minute.toString().padLeft(2, '0');
    final secondFormat = second ? ':${second.toString().padLeft(2, '0')}' : '';

    return '$hourFormat:$minuteFormat$secondFormat';
  }

  String to12HourFormat({bool left = false, bool second = false}) {
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;
    final period = hour < 12 ? 'AM' : 'PM';

    final leftPeriod = left ? '$period ' : '';
    final rightPeriod = left ? '' : ' $period';
    final hourFormat = hour12.toString().padLeft(2, '0');
    final minuteFormat = minute.toString().padLeft(2, '0');
    final secondFormat = second ? ':${second.toString().padLeft(2, '0')}' : '';

    return '$leftPeriod$hourFormat:$minuteFormat$secondFormat$rightPeriod';
  }
}
