part of '../../easy_extension.dart';

extension DateTimeExtension on DateTime {
  String get toTwoLine => intl.DateFormat('yyyy-MM-dd\nHH:mm:ss').format(this);
  String get toSingleLine => intl.DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  String toFormat(String format) {
    return intl.DateFormat(format).format(this);
  }

  /// Formats provided [date] to a fuzzy time like 'a moment ago'
  ///
  /// - If [locale] is passed will look for message for that locale, if you want
  ///   to add or override locales use [setLocaleMessages]. Defaults to 'en'
  /// - If [clock] is passed this will be the point of reference for calculating
  ///   the elapsed time. Defaults to DateTime.now()
  /// - If [allowFromNow] is passed, format will use the From prefix, ie. a date
  ///   5 minutes from now in 'en' locale will display as "5 minutes from now"
  String toTimeAgo({
    String? locale,
    DateTime? clock,
    bool allowFromNow = false,
  }) {
    return timeago.format(
      this,
      locale: locale,
      clock: clock,
      allowFromNow: allowFromNow,
    );
  }
}
