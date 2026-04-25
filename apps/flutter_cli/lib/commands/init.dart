import 'dart:io';
import 'package:args/args.dart';
import '../utils/logger.dart';
import '../utils/file_helper.dart';

class InitCommand {
  void execute(List<String> arguments) {
    final parser = ArgParser()
      ..addFlag('help',
          abbr: 'h', negatable: false, help: 'Show help for init command')
      ..addOption('dir',
          abbr: 'd',
          help: 'Custom components directory',
          defaultsTo: 'lib/ui/components');

    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      _printHelp();
      return;
    }

    Logger.info('Initializing FlutMan project...');
    Logger.newLine();

    try {
      FileHelper.verifyFlutterProject();
      Logger.success('Flutter project detected (pubspec.yaml found)');
      Logger.newLine();

      final componentsDir = results['dir'] as String;
      final coreDir = 'lib/ui/core';

      Logger.info('Creating configuration file...');
      FileHelper.writeFlutmanConfig(componentsDir: componentsDir);

      Logger.info('Setting up directory structure...');
      FileHelper.createDirectory(componentsDir);
      FileHelper.createDirectory(coreDir);
      Logger.newLine();

      Logger.success('FlutMan initialized successfully!');
      Logger.newLine();
      Logger.hint('Next steps:');
      Logger.hint('  flutman add button       # Add a single component');
      Logger.hint('  flutman add button card  # Add multiple components');
    } catch (e) {
      Logger.error('Initialization failed: $e');
      exit(1);
    }
  }

  void _printHelp() {
    print('Initialize FlutMan in your Flutter project');
    print('');
    print('Usage: flutman init');
    print('');
    print('This command will:');
    print('  - Verify Flutter SDK installation');
    print('  - Create flutman.yaml configuration');
    print('  - Set up the components directory structure');
  }
}
