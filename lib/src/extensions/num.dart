part of '../../easy_extension.dart';

extension IntExtension on int {
  Uint8List toBytes([Endian endian = Endian.big]) {
    final data = ByteData(8);
    data.setInt64(0, this, endian);
    return data.buffer.asUint8List();
  }

  String toChar() => String.fromCharCode(this);

  /// ```dart
  /// 101.ordinal(); // 101st
  ///
  /// 999218.ordinal(); // 999218th
  /// ```
  String ordinal() {
    final onesPlace = this % 10;
    final tensPlace = ((this / 10).floor()) % 10;
    if (tensPlace == 1) {
      return '${this}th';
    } else {
      switch (onesPlace) {
        case 1:
          return '${this}st';
        case 2:
          return '${this}nd';
        case 3:
          return '${this}rd';
        default:
          return '${this}th';
      }
    }
  }

  String toBytesHumanString([int fractionDigits = 2]) {
    final sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];

    if (this == 0) return '0 Byte';

    final i = (math.log(this) / math.log(1024)).floor();
    return '${(this / math.pow(1024, i)).toStringAsFixed(fractionDigits)} ${sizes[i]}';
  }
}

extension DoubleExtension on double {
  Uint8List toBytes([Endian endian = Endian.big]) {
    final data = ByteData(8);
    data.setFloat64(0, this, endian);
    return data.buffer.asUint8List();
  }
}

extension NumExtension<T extends num> on T {
  bool inRange(Range<num> range) => range.contains(this);

  bool between(num first, num endInclusive) => first.rangeTo(endInclusive).contains(this);

  /// ```dart
  /// print(10.coerceAtMost(5)) // 5
  /// print(10.coerceAtMost(20)) // 10
  /// ```
  T coerceAtMost(T maximumValue) => this > maximumValue ? maximumValue : this;

  /// ```dart
  /// print(10.coerceAtLeast(5)) // 10
  /// print(10.coerceAtLeast(20)) // 20
  /// ```
  T coerceAtLeast(T minimumValue) => this < minimumValue ? minimumValue : this;

  /// ```dart
  /// print(10.coerceIn(1, 100)) // 10
  /// print(0.coerceIn(1, 100)) // 1
  /// print(500.coerceIn(1, 100)) // 100
  /// 10.coerceIn(100, 0) // will fail with ArgumentError
  /// ````
  T coerceIn(T minimumValue, [T? maximumValue]) {
    if (maximumValue != null && minimumValue > maximumValue) {
      throw ArgumentError(
        'Cannot coerce value to an empty range: '
        'maximum $maximumValue is less than minimum $minimumValue.',
      );
    }
    if (this < minimumValue) return minimumValue;
    if (maximumValue != null && this > maximumValue) return maximumValue;
    return this;
  }

  Duration get toMicrosecond => Duration(microseconds: round());
  Duration get toMillisecond => NumExtension(this * 1000).toMicrosecond;
  Duration get toSecond => NumExtension(this * 1000 * 1000).toMicrosecond;
  Duration get toMinute => NumExtension(this * 1000 * 1000 * 60).toMicrosecond;
  Duration get toHour => NumExtension(this * 1000 * 1000 * 60 * 60).toMicrosecond;
  Duration get toDay => NumExtension(this * 1000 * 1000 * 60 * 60 * 24).toMicrosecond;

  double get px => kIsWeb ? (this * 1) : (this / PlatformDispatcher.instance.views.first.devicePixelRatio);

  double get pxReal => this * PlatformDispatcher.instance.views.first.devicePixelRatio;

  /// ```dart
  /// print(32400.formatTzOffsetToUTC;) // UTC+9:00
  /// print(34200.formatTzOffsetToUTC;) // UTC+9:30
  /// ```
  String get formatTzOffsetToUTC {
    int hours = this ~/ 3600;
    int minutes = (this % 3600) ~/ 60;
    return 'UTC${hours >= 0 ? '+' : '-'}${hours.abs()}${minutes != 0 ? ":${minutes.toString().padLeft(2, '0')}" : ''}';
  }
}
