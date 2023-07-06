part of easy_extension;

extension DateTimeExtension on DateTime {
  String get toTwoLine => DateFormat('yyyy-MM-dd\nHH:mm:ss').format(this);
  String get toSingleLine => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  String toFormat(String format) {
    return DateFormat(format).format(this);
  }
}
