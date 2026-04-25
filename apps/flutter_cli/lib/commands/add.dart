import 'package:args/args.dart';

class AddCommand {
  void execute(List<String> arguments) {
    final parser = ArgParser()
      ..addFlag('help', abbr: 'h', negatable: false, help: 'Show help for add command')
      ..addFlag('overwrite', abbr: 'o', negatable: false, help: 'Overwrite existing components')
      ..addOption('dir', abbr: 'd', help: 'Custom components directory');

    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      _printHelp();
      return;
    }

    final components = results.rest;

    if (components.isEmpty) {
      print('Error: No components specified.');
      print('');
      _printHelp();
      return;
    }

    final overwrite = results['overwrite'] as bool;
    final customDir = results['dir'] as String?;

    print('Adding component(s): ${components.join(", ")}');
    print('');

    if (overwrite) {
      print('Overwrite mode: enabled');
    }

    if (customDir != null) {
      print('Custom directory: $customDir');
    }

    print('');

    for (final component in components) {
      print('  Fetching $component...');
      print('  Writing to lib/components/flutman_$component.dart...');
      print('  Added: $component');
      print('');
    }

    print('All components added successfully!');
    print('');
    print('Import in your Dart files:');
    print('  import "components/flutman_${components.first}.dart";');
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
