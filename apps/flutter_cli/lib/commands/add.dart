import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;
import '../utils/logger.dart';
import '../utils/file_helper.dart';
import '../utils/api_client.dart';

class AddCommand {
  Future<void> execute(List<String> arguments) async {
    final parser = ArgParser()
      ..addFlag('help',
          abbr: 'h', negatable: false, help: 'Show help for add command')
      ..addFlag('overwrite',
          abbr: 'o', negatable: false, help: 'Overwrite existing components')
      ..addOption('dir', abbr: 'd', help: 'Custom components directory');

    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      _printHelp();
      return;
    }

    final components = results.rest;

    if (components.isEmpty) {
      Logger.error('No components specified.');
      Logger.newLine();
      _printHelp();
      return;
    }

    final overwrite = results['overwrite'] as bool;
    final customDir = results['dir'] as String?;

    try {
      FileHelper.verifyFlutterProject();

      Logger.info('Adding component(s): ${components.join(", ")}');
      Logger.newLine();

      if (overwrite) {
        Logger.warning('Overwrite mode: enabled');
        Logger.newLine();
      }

      final componentsDir = customDir ?? FileHelper.getComponentsDir();
      FileHelper.createDirectory(componentsDir);

      final Set<String> allDependencies = {};

      for (final componentName in components) {
        await _addComponent(
            componentName, componentsDir, overwrite, allDependencies);
      }

      if (allDependencies.isNotEmpty) {
        Logger.newLine();
        Logger.info('Installing dependencies...');
        await _installDependencies(allDependencies);
      }

      Logger.newLine();
      Logger.success('All components added successfully!');
      Logger.newLine();
      Logger.hint('Import in your Dart files:');
      for (final component in components) {
        final fileName = _toSnakeCase(component);
        Logger.hint('  import \'$componentsDir/$fileName.dart\';');
      }
    } catch (e) {
      Logger.error('Failed to add components: $e');
      exit(1);
    }
  }

  Future<void> _addComponent(
    String componentName,
    String componentsDir,
    bool overwrite,
    Set<String> allDependencies,
  ) async {
    try {
      Logger.info('Fetching $componentName...');
      final componentData = await ApiClient.fetchComponent(componentName);

      final code = componentData['code'] as String?;
      final dependencies =
          (componentData['dependencies'] as List<dynamic>?)?.cast<String>() ??
              [];
      final fileName = componentData['fileName'] as String? ??
          '${_toSnakeCase(componentName)}.dart';

      if (code == null || code.isEmpty) {
        Logger.error('No code received for $componentName');
        return;
      }

      final filePath = path.join(componentsDir, fileName);
      FileHelper.writeDartFile(filePath, code, overwrite: overwrite);

      allDependencies.addAll(dependencies.where((d) => d != 'flutter'));
      Logger.success('Added: $componentName');
    } catch (e) {
      Logger.error('Failed to add $componentName: $e');
    }
  }

  Future<void> _installDependencies(Set<String> dependencies) async {
    for (final dep in dependencies) {
      try {
        Logger.info('Running: flutter pub add $dep');
        final result = await Process.run(
          'flutter',
          ['pub', 'add', dep],
          runInShell: true,
        );

        if (result.exitCode == 0) {
          Logger.success('Added dependency: $dep');
        } else {
          Logger.warning('Failed to add $dep: ${result.stderr}');
          Logger.hint('Run manually: flutter pub add $dep');
        }
      } catch (e) {
        Logger.warning('Could not run flutter pub add $dep: $e');
        Logger.hint('Run manually: flutter pub add $dep');
      }
    }
  }

  String _toSnakeCase(String input) {
    return input.toLowerCase().replaceAll(' ', '_');
  }

  void _printHelp() {
    print('Add FlutMan components to your project');
    print('');
    print('Usage: flutman add <component> [component2] [component3]...');
    print('');
    print('Arguments:');
    print('  component    Name of the component to add');
    print('');
    print('Options:');
    print('  -o, --overwrite    Overwrite existing components');
    print('  -d, --dir          Custom components directory');
    print('');
    print('Examples:');
    print('  flutman add button');
    print('  flutman add button card input');
    print('  flutman add button --overwrite');
  }
}
