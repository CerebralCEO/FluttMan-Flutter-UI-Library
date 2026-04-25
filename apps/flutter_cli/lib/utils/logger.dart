import 'dart:io';

class Logger {
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _cyan = '\x1B[36m';
  static const String _gray = '\x1B[90m';

  static bool _useColors = true;

  static void disableColors() {
    _useColors = false;
  }

  static String _colorize(String text, String colorCode) {
    if (!_useColors || Platform.isWindows && !Platform.environment.containsKey('WT_SESSION')) {
      return text;
    }
    return '$colorCode$text$_reset';
  }

  static void info(String message) {
    print(_colorize('ℹ $message', _blue));
  }

  static void success(String message) {
    print(_colorize('✓ $message', _green));
  }

  static void error(String message) {
    print(_colorize('✗ $message', _red));
  }

  static void warning(String message) {
    print(_colorize('⚠ $message', _yellow));
  }

  static void hint(String message) {
    print(_colorize('→ $message', _cyan));
  }

  static void debug(String message) {
    print(_colorize('• $message', _gray));
  }

  static void newLine() {
    print('');
  }
}
