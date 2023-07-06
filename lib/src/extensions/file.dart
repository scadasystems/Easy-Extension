part of easy_extension;

extension FileExtension on File {
  Future<void> appendBytes(List<int> bytes) async {
    final raf = await open(mode: FileMode.writeOnlyAppend);
    await raf.writeFrom(bytes);
    await raf.close();
  }

  Future<void> appendString(String string, {Encoding encoding = utf8}) async {
    final raf = await open(mode: FileMode.writeOnlyAppend);
    await raf.writeString(string);
    await raf.close();
  }

  Future<void> forEachBlock(
    int blockSize,
    void Function(Uint8List buffer) action,
  ) async {
    final raf = await open();
    // ignore: literal_only_boolean_expressions
    while (true) {
      final buffer = await raf.read(blockSize);
      if (buffer.length == blockSize) {
        action(buffer);
      } else if (buffer.isNotEmpty) {
        action(buffer);
        break;
      } else {
        break;
      }
    }
    await raf.close();
  }
}

extension FileSystemEntityExtension on FileSystemEntity {
  /// ```dart
  /// File('path/to/foo.dart').name; // -> 'foo.dart'
  /// Directory('path/to').name;          // -> 'to'
  /// ```
  ///
  /// ```dart
  /// Directory('path/to/').name; // -> 'to'
  /// ```
  String get name => path_helper.basename(path);

  /// ```dart
  /// File('path/to/foo.dart').nameWithoutExtension; // -> 'foo'
  /// ```
  ///
  /// ```dart
  /// File('path/to/foo.dart/').nameWithoutExtension; // -> 'foo'
  /// ```
  String get nameWithoutExtension => path_helper.basenameWithoutExtension(path);

  /// ```dart
  /// File().dirname('path/to/foo.dart'); // -> 'path/to'
  /// Directory('path/to').dirName;          // -> 'path'
  /// ```
  ///
  /// ```dart
  /// Directory('path/to/').dirName; // -> 'path'
  /// ```
  ///
  /// ```dart
  /// Directory('/').dirName;  // -> '/' (posix)
  /// Directory('c:\').dirName;  // -> 'c:\' (windows)
  /// ```
  ///
  /// ```dart
  /// Directory('foo').dirName;  // -> '.'
  /// Directory('').dirName;  // -> '.'
  /// ```
  String get dirName => path_helper.dirname(path);

  /// ```dart
  /// Directory('/root/path/foo.dart').isWithin(Directory('/root/path')); // -> true
  /// Directory('/root/path').isWithin(Directory('/root/other')); // -> false
  /// Directory('/root/path').isWithin(Directory('/root/path')) // -> false
  /// ```
  bool isWithin(Directory parent) => path_helper.isWithin(parent.path, path);

  ///```dart
  ///File('path/to/foo.dart').withName('bar.txt'); // -> File('path/to/bar.txt')
  ///File('path/to/foo').withName('bar') // -> File('path/to/bar')
  ///```
  FileSystemEntity withName(String newName) {
    return File('$dirName${Platform.pathSeparator}$newName');
  }

  ///```dart
  ///File('path/to/foo.dart').extension; // -> '.dart'
  ///File('path/to/foo').extension; // -> ''
  ///File('path.to/foo').extension; // -> ''
  ///File('path/to/foo.dart.js').extension; // -> '.js'
  ///```
  ///
  ///```Dart
  ///File('~/.profile').extension;    // -> ''
  ///File('~/.notes.txt').extension;    // -> '.txt'
  ///```
  String get extension => path_helper.extension(path);
}
