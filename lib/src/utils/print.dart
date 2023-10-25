import 'dart:developer' as developer;

/// Colorful Log to console
/// - [Print.initialize] : Ininitialize Print
/// - [Print.log] : Normal log
/// - [Print.black] : Black log
/// - [Print.red] : Red log
/// - [Print.green] : Green log
/// - [Print.yellow] : Yellow log
/// - [Print.blue] : Blue log
/// - [Print.magenta] : Magenta log
/// - [Print.cyan] : Cyan log
/// - [Print.white] : White log
class Print {
  static String _tag = 'flutter';

  /// Ininitialize Print
  /// - [tag] : Tag Name, Default: 'flutter'
  static void initialize({
    String tag = 'flutter',
  }) {
    _tag = tag;
  }

  /// Normal Log to console
  static void log(dynamic text) => developer.log('$text', name: _tag);

  /// Black Log to console
  static void black(dynamic text) => developer.log('\x1B[30m$text\x1B[0m', name: _tag);

  /// Red Log to console
  static void red(dynamic text) => developer.log('\x1B[31m$text\x1B[0m', name: _tag);

  /// Green Log to console
  static void green(dynamic text) => developer.log('\x1B[32m$text\x1B[0m', name: _tag);

  /// Yellow Log to console
  static void yellow(dynamic text) => developer.log('\x1B[33m$text\x1B[0m', name: _tag);

  /// Blue Log to console
  static void blue(dynamic text) => developer.log('\x1B[34m$text\x1B[0m', name: _tag);

  /// Magenta Log to console
  static void magenta(dynamic text) => developer.log('\x1B[35m$text\x1B[0m', name: _tag);

  /// Cyan Log to console
  static void cyan(dynamic text) => developer.log('\x1B[36m$text\x1B[0m', name: _tag);

  /// White Log to console
  static void white(dynamic text) => developer.log('\x1B[37m$text\x1B[0m', name: _tag);
}
