// ignore_for_file: no_leading_underscores_for_local_identifiers

part of '../../easy_extension.dart';

extension StringExtension on String {
  int toInt({int? radix}) => int.parse(this, radix: radix);
  bool get isInt => toIntOrNull() != null;
  int? toIntOrNull({int? radix}) => int.tryParse(this, radix: radix);

  double toDouble() => double.parse(this);
  bool get isDouble => toDoubleOrNull() != null;
  double? toDoubleOrNull() => double.tryParse(this);

  List<int> toUtf8() => utf8.encode(this);
  List<int> toUtf16() => codeUnits;

  /// ```dart
  /// print('abc'.md5); //900150983cd24fb0d6963f7d28e17f72
  /// print('message digest'.md5); //f96b697d7cb7938d525a2f31aaf161d0
  /// ```
  String get md5 => crypto.md5.convert(toUtf8()).toString();

  /// ```dart
  /// 'hello'.firstUpperCase // Hello
  /// ```
  String get firstUpperCase => length > 1 ? this[0].toUpperCase() + substring(1) : '';

  /// ```dart
  /// 'HELLO'.firstLowerCase // hELLO
  /// ```
  String get firstLowerCase => length > 1 ? this[0].toLowerCase() + substring(1) : '';

  /// ```dart
  /// 'camelCase'.toKebabCase // camel-case
  /// 'PascalCase'.toKebabCase // pascal-case
  /// 'snake_case'.toKebabCase // snake-case
  /// 'kebab-case'.toKebabCase // kebab-case
  /// ```
  String get toKebabCase => replaceAllMapped(
        RegExp(r'([a-z0-9])([A-Z])'),
        (Match match) => '${match[1]}-${match[2]!.toLowerCase()}',
      ).replaceAll('_', '-').toLowerCase();

  /// ```dart
  /// 'Hi'.isFirstUpperCase // true
  /// 'hi'.isFirstUpperCase // false
  /// ```
  bool get isFirstUpperCase => isNotEmpty && this[0].isUpperCase;

  String get toReverse {
    final range = characters.Characters(this).iteratorAtEnd;
    final buffer = StringBuffer();
    while (range.moveBack()) {
      buffer.write(range.current);
    }
    return buffer.toString();
  }

  /// ```dart
  /// 'HI'.isUpperCase // true
  /// 'Hi'.isUpperCase // false
  /// '!'.isUpperCase // false
  /// 'HEY, YOU!'.isUpperCase // true
  /// ```
  bool get isUpperCase => this == toUpperCase() && this != toLowerCase();

  /// ```dart
  /// 'hi'.isLowerCase // true
  /// 'Hi'.isLowerCase // false
  /// '!'.isLowerCase // false
  /// 'hey, you!'.isLowerCase // true
  /// ```
  bool get isLowerCase => this == toLowerCase() && this != toUpperCase();

  ///  ```dart
  /// print('awesomeString'.slice(0,6)); // awesome
  /// print('awesomeString'.slice(7)); // String
  /// ```
  String slice(int start, [int end = -1]) {
    final _start = start < 0 ? start + length : start;
    final _end = end < 0 ? end + length : end;

    RangeError.checkValidRange(_start, _end, length);

    return substring(_start, _end + 1);
  }

  bool matches(RegExp regex) => regex.hasMatch(this);

  String get uriEncode => Uri.encodeFull(this);
  String get uriDecode => Uri.decodeFull(this);

  String cardFormatSecret() {
    if (length == 6) {
      return '${substring(0, 4)}-${substring(4, 6)}**\n-****-****';
    } else {
      return this;
    }
  }

  String get phoneFormat {
    if (length == 11) {
      return '${substring(0, 3)}-${substring(3, 7)}-${substring(7, 11)}';
    } else if (length == 9) {
      return '${substring(0, 2)}-${substring(2, 5)}-${substring(5, 9)}';
    } else if (isEmpty) {
      return '';
    } else {
      return this;
    }
  }

  String get getYoutubeVideoId {
    RegExp regExp = RegExp(
      r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
      caseSensitive: false,
      multiLine: false,
    );

    final match = regExp.firstMatch(this)?.group(1);

    String str = match ?? '';

    return str;
  }

  bool get validateMAC {
    RegExp exp = RegExp(r"^([0-9A-Fa-f]{2}[:]){5}([0-9A-Fa-f]{2})$");

    return exp.hasMatch(this);
  }

  String byteFormat(int bytes, int decimals, {bool hasSuffixes = true}) {
    if (bytes <= 0) return "0 B";

    if (hasSuffixes) {
      const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
      var i = (math.log(bytes) / math.log(1024)).floor();

      return '${(bytes / math.pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
    } else {
      return (bytes / math.pow(1024, 2)).toStringAsFixed(decimals);
    }
  }

  String durationFormat(Duration duration) {
    var seconds = duration.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];

    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    tokens.add('${seconds}s');

    return tokens.join(' ');
  }

  String removeCharacters(
    String text, {
    List<String>? charList,
  }) {
    List<String> list = charList ??
        [
          '!', '"', '#', '\$', '%', '&', '\'', '*', '+', '-', //
          '/', ':', ';', '<', '=', '>', '?', '@', '\\', '^',
          '`', '|', '~', ','
        ];

    for (var element in list) {
      text = text.replaceAll(element, '');
    }

    return text;
  }

  String changeCharacters(
    String text, {
    List<String>? charList,
    String swapChar = '_',
  }) {
    List<String> list = charList ??
        [
          '!', '"', '#', '\$', '%', '&', '\'', '*', '+', '-', //
          '/', ':', ';', '<', '=', '>', '?', '@', '\\', '^',
          '`', '|', '~', ','
        ];

    for (var element in list) {
      text = text.replaceAll(element, swapChar);
    }

    return text;
  }

  bool get isBlank => trimLeft().isEmpty;

  Uint8List get toUint8List => base64Decode(this);

  bool isJson() {
    try {
      jsonDecode(this);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// ```dart
  /// 'hello.txt'.toWithoutExt() // hello
  /// 'hello'.toWithoutExt() // hello
  /// ```
  String toWithoutExt() {
    final index = lastIndexOf('.');
    return index == -1 ? this : substring(0, index);
  }

  bool isMacAddress() {
    RegExp exp = RegExp(r"^([0-9A-Fa-f]{2}[:]){5}([0-9A-Fa-f]{2})$");

    return exp.hasMatch(this);
  }
}

extension NullStringExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
  bool get isNullOrBlank => this?.isBlank ?? true;
  bool get isNotNullOrBlank => !isNullOrBlank;
  String orEmpty() => this ?? '';
}
