import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/foundation.dart';

/// Colorful Log to console
/// - [Log.d] : Normal log
/// - [Log.black] : Black log
/// - [Log.red] : Red log
/// - [Log.green] : Green log
/// - [Log.yellow] : Yellow log
/// - [Log.blue] : Blue log
/// - [Log.magenta] : Magenta log
/// - [Log.cyan] : Cyan log
/// - [Log.white] : White log
class Log {
  static bool _isDebugMode = kDebugMode;
  static bool _enableTime = false;
  static String _format = 'yyyy-MM-dd HH:mm:ss.SSS';
  static String _prefix = '';

  static String get _getTime => _enableTime ? '${DateTime.now().toFormat(_format)} ┠ ' : '';

  static void initialize({
    bool isDebugMode = kDebugMode,
    bool enableTime = false,
    String format = 'yyyy-MM-dd HH:mm:ss.SSS',
    String prefix = '',
  }) {
    _isDebugMode = isDebugMode;
    _enableTime = enableTime;
    _format = format;
    _prefix = prefix;
  }

  /// Normal Log to console
  static void d(dynamic text) {
    if (_isDebugMode) debugPrint('$_prefix$_getTime$text');
  }

  /// Red Log to console
  static void red(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[31m$_prefix$_getTime$text\x1B[0m');
  }

  /// Orange Log to console
  static void orange(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[38;5;208m$_prefix$_getTime$text\x1B[0m');
  }

  /// Green Log to console
  static void green(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[32m$_prefix$_getTime$text\x1B[0m');
  }

  /// Blue Log to console
  static void blue(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[34m$_prefix$_getTime$text\x1B[0m');
  }

  /// Yellow Log to console
  static void yellow(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[33m$_prefix$_getTime$text\x1B[0m');
  }

  /// Magenta Log to console
  static void magenta(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[35m$_prefix$_getTime$text\x1B[0m');
  }

  /// Cyan Log to console
  static void cyan(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[36m$_prefix$_getTime$text\x1B[0m');
  }

  /// White Log to console
  static void white(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[37m$_prefix$_getTime$text\x1B[0m');
  }

  /// Black Log to console
  static void black(dynamic text) {
    if (_isDebugMode) debugPrint('\x1B[30m$_prefix$_getTime$text\x1B[0m');
  }
}
