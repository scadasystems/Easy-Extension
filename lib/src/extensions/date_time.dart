part of '../../easy_extension.dart';

extension DateTimeExtension on DateTime {
  String get toTwoLine => intl.DateFormat('yyyy-MM-dd\nHH:mm:ss').format(this);
  String get toSingleLine => intl.DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  String toFormat(String format) {
    return intl.DateFormat(format).format(this);
  }
}
