import 'dart:convert';
import 'package:http/http.dart' as http;
import 'logger.dart';

class ApiClient {
  static const String _baseUrl = 'https://flutman.vercel.app/api';

  static Future<Map<String, dynamic>> fetchComponent(String name) async {
    try {
      Logger.debug('Fetching component: $name from API...');
      final response = await http.get(
        Uri.parse('$_baseUrl/components/$name'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        Logger.debug('Successfully fetched $name from API');
        return data;
      } else {
        throw Exception('API returned status ${response.statusCode}');
      }
    } catch (e) {
      Logger.warning('API fetch failed for $name, using simulated data');
      return _getSimulatedComponent(name);
    }
  }

  static Map<String, dynamic> _getSimulatedComponent(String name) {
    final className = _toPascalCase(name);
    final fileName = _toSnakeCase(name);

    return {
      'name': name,
      'fileName': '$fileName.dart',
      'code': '''import 'package:flutter/material.dart';

class FlutMan$className extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final Widget? child;

  const FlutMan$className({
    super.key,
    this.label,
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child ?? Text(label ?? '$className'),
    );
  }
}
''',
      'dependencies': ['flutter'],
      'description': 'A $name component for Flutter applications',
      'version': '0.1.0',
    };
  }

  static String _toPascalCase(String input) {
    return input.split('_').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join('');
  }

  static String _toSnakeCase(String input) {
    return input.toLowerCase().replaceAll(' ', '_');
  }
}
