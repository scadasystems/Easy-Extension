part of easy_extension;

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
}
