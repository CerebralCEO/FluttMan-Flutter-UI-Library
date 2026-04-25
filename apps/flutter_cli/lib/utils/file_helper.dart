import 'dart:convert';
import 'dart:io';
import 'logger.dart';

class FileHelper {
  static bool isFlutterProject() {
    final pubspec = File('pubspec.yaml');
    return pubspec.existsSync();
  }

  static void verifyFlutterProject() {
    if (!isFlutterProject()) {
      Logger.error('No pubspec.yaml found in current directory.');
      Logger.hint('Make sure you are in a Flutter project root.');
      Logger.hint('Run: flutter create my_app');
      exit(1);
    }
  }

  static void writeFlutmanConfig({String? componentsDir}) {
    try {
      final config = {
        'version': '0.1.0',
        'componentsDir': componentsDir ?? 'lib/ui/components',
        'coreDir': 'lib/ui/core',
        'createdAt': DateTime.now().toIso8601String(),
      };

      final configFile = File('flutman.json');
      configFile.writeAsStringSync('${jsonEncode(config)}\n');
      Logger.success('Created flutman.json configuration file');
    } catch (e) {
      Logger.error('Failed to create flutman.json: $e');
      exit(1);
    }
  }

  static Map<String, dynamic>? readFlutmanConfig() {
    try {
      final configFile = File('flutman.json');
      if (!configFile.existsSync()) {
        return null;
      }
      final content = configFile.readAsStringSync();
      return jsonDecode(content) as Map<String, dynamic>;
    } catch (e) {
      Logger.error('Failed to read flutman.json: $e');
      return null;
    }
  }

  static void createDirectory(String dirPath) {
    try {
      final directory = Directory(dirPath);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
        Logger.debug('Created directory: $dirPath');
      }
    } catch (e) {
      Logger.error('Failed to create directory $dirPath: $e');
      throw Exception('Directory creation failed');
    }
  }

  static void writeDartFile(String filePath, String content,
      {bool overwrite = false}) {
    try {
      final file = File(filePath);
      if (file.existsSync() && !overwrite) {
        Logger.warning(
            'File already exists: $filePath (use --overwrite to replace)');
        return;
      }

      file.writeAsStringSync(content);
      Logger.success('Wrote: $filePath');
    } catch (e) {
      Logger.error('Failed to write file $filePath: $e');
      throw Exception('File write failed');
    }
  }

  static String getComponentsDir() {
    final config = readFlutmanConfig();
    final dir = config?['componentsDir'] as String? ?? 'lib/ui/components';
    return dir;
  }

  static String getCoreDir() {
    final config = readFlutmanConfig();
    final dir = config?['coreDir'] as String? ?? 'lib/ui/core';
    return dir;
  }
}
