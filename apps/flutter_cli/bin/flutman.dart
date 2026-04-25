import 'package:args/args.dart';
import 'package:flutman_cli/commands/init.dart';
import 'package:flutman_cli/commands/add.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addCommand('init')
    ..addCommand('add')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show help information')
    ..addFlag('version', abbr: 'v', negatable: false, help: 'Show version');

  try {
    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      _printHelp(parser);
      return;
    }

    if (results['version'] as bool) {
      print('flutman CLI v0.1.0');
      return;
    }

    final command = results.command;

    if (command == null) {
      print('Error: No command provided.');
      print('');
      _printHelp(parser);
      return;
    }

    switch (command.name) {
      case 'init':
        final initCommand = InitCommand();
        initCommand.execute(command.arguments);
        break;
      case 'add':
        final addCommand = AddCommand();
        addCommand.execute(command.arguments);
        break;
      default:
        print('Error: Unknown command "${command.name}"');
        print('');
        _printHelp(parser);
    }
  } on FormatException catch (e) {
    print('Error: ${e.message}');
    print('');
    _printHelp(parser);
  } catch (e) {
    print('Unexpected error: $e');
  }
}

void _printHelp(ArgParser parser) {
  print('FlutMan CLI - Flutter UI Component Library');
  print('');
  print('Usage: flutman <command> [arguments]');
  print('');
  print('Available commands:');
  print('  init     Initialize FlutMan in your Flutter project');
  print('  add      Add one or more components to your project');
  print('');
  print('Global options:');
  print(parser.usage);
}
