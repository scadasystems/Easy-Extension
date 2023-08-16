part of easy_extension;

enum SizeUnit { tb, gb, mb, kb, byte }

class ByteConverter {
  double _bytes = 0.0;
  int _bits = 0;

  ByteConverter(this._bytes) {
    _bits = (_bytes * 8.0).ceil();
  }

  ByteConverter.withBits(this._bits) {
    _bytes = _bits / 8;
  }

  double _withPrecision(double value, {int precision = 2}) {
    var valString = '$value';
    var endingIndex = valString.indexOf('.') + (precision++);

    if (valString.length < endingIndex) {
      return value;
    }

    return double.tryParse(valString.substring(0, endingIndex)) ?? value;
  }

  double get kiloBytes => _bytes / 1000;

  double get megaBytes => _bytes / 1000000;

  double get gigaBytes => _bytes / 1000000000;

  double get teraBytes => _bytes / 1000000000000;

  double get petaBytes => _bytes / 1E+15;

  double asBytes({int precision = 2}) =>
      _withPrecision(_bytes, precision: precision);

  static ByteConverter fromBytes(double value) => ByteConverter(value);

  static ByteConverter fromBits(int value) => ByteConverter.withBits(value);

  static ByteConverter fromKibiBytes(double value) =>
      ByteConverter(value * 1024.0);

  static ByteConverter fromMebiBytes(double value) =>
      ByteConverter(value * 1048576.0);

  static ByteConverter fromGibiBytes(double value) =>
      ByteConverter(value * 1073741824.0);

  static ByteConverter fromTebiBytes(double value) =>
      ByteConverter(value * 1099511627776.0);

  static ByteConverter fromPebiBytes(double value) =>
      ByteConverter(value * 1125899906842624.0);

  static ByteConverter fromKiloBytes(double value) =>
      ByteConverter(value * 1000.0);

  static ByteConverter fromMegaBytes(double value) =>
      ByteConverter(value * 1000000.0);

  static ByteConverter fromGigaBytes(double value) =>
      ByteConverter(value * 1000000000.0);

  static ByteConverter fromTeraBytes(double value) =>
      ByteConverter(value * 1000000000000.0);

  static ByteConverter fromPetaBytes(double value) =>
      ByteConverter(value * 1E+15);

  ByteConverter add(ByteConverter value) => this + value;

  ByteConverter subtract(ByteConverter value) => this - value;

  ByteConverter addBytes(double value) => this + fromBytes(value);

  ByteConverter addKiloBytes(double value) => this + fromKiloBytes(value);

  ByteConverter addMegaBytes(double value) => this + fromMegaBytes(value);

  ByteConverter addGigaBytes(double value) => this + fromGigaBytes(value);

  ByteConverter addTeraBytes(double value) => this + fromTeraBytes(value);

  ByteConverter addPetaBytes(double value) => this + fromPetaBytes(value);

  ByteConverter addKibiBytes(double value) => this + fromKibiBytes(value);

  ByteConverter addMebiBytes(double value) => this + fromMebiBytes(value);

  ByteConverter addGibiBytes(double value) => this + fromGibiBytes(value);

  ByteConverter addTebiBytes(double value) => this + fromTebiBytes(value);

  ByteConverter addPebiBytes(double value) => this + fromPebiBytes(value);

  ByteConverter operator +(ByteConverter instance) =>
      ByteConverter(instance._bytes + _bytes);

  ByteConverter operator -(ByteConverter instance) =>
      ByteConverter(_bytes - instance._bytes);

  bool operator >(ByteConverter instance) => _bits > instance._bits;

  bool operator <(ByteConverter instance) => _bits < instance._bits;

  bool operator <=(ByteConverter instance) => _bits <= instance._bits;

  bool operator >=(ByteConverter instance) => _bits >= instance._bits;

  static int compare(ByteConverter a, ByteConverter b) =>
      a._bits.compareTo(b._bits);

  static bool isEqual(ByteConverter a, ByteConverter b) => a.isEqualTo(b);

  int compareTo(ByteConverter instance) => compare(this, instance);

  bool isEqualTo(ByteConverter instance) => _bits == instance._bits;

  String toHumanReadable(SizeUnit unit, {int precision = 2}) {
    switch (unit) {
      case SizeUnit.tb:
        return '${_withPrecision(teraBytes, precision: precision)} TB';
      case SizeUnit.gb:
        return '${_withPrecision(gigaBytes, precision: precision)} GB';
      case SizeUnit.mb:
        return '${_withPrecision(megaBytes, precision: precision)} MB';
      case SizeUnit.kb:
        return '${_withPrecision(kiloBytes, precision: precision)} MB';
      case SizeUnit.byte:
        return '${asBytes(precision: precision)} B';
    }
  }
}
