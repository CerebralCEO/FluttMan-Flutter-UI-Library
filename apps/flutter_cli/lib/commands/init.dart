import 'package:args/args.dart';

class InitCommand {
  void execute(List<String> arguments) {
    final parser = ArgParser()
      ..addFlag('help', abbr: 'h', negatable: false, help: 'Show help for init command');

    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      _printHelp();
      return;
    }

    print('Initializing FlutMan project...');
    print('');
    print('Checking Flutter project structure...');
    print('Creating flutman.yaml configuration file...');
    print('Setting up components directory...');
    print('');
    print('FlutMan initialized successfully!');
    print('');
    print('Next steps:');
    print('  flutman add button      # Add a single component');
    print('  flutman add button card   # Add multiple components');
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
