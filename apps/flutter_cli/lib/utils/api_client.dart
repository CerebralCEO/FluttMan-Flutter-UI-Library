import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'logger.dart';

class ApiClient {
  // Local development API URL
  static const String _baseUrl = 'http://localhost:4000/api';

  static Future<Map<String, dynamic>> fetchComponent(String name) async {
    try {
      Logger.debug('Fetching component: $name from API...');
      final response = await http
          .get(
            Uri.parse('$_baseUrl/components/$name'),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        Logger.debug('Successfully fetched $name from API');
        return data;
      } else if (response.statusCode == 404) {
        throw Exception(
            'Component "$name" not found. Make sure the server is running and the component exists.');
      } else if (response.statusCode >= 500) {
        throw Exception(
            'Server error (${response.statusCode}). Please try again later.');
      } else {
        throw Exception(
            'API returned status ${response.statusCode}: ${response.body}');
      }
    } on SocketException catch (_) {
      throw Exception('Cannot connect to FlutMan API at $_baseUrl.\n'
          'Please ensure:\n'
          '  1. The Next.js server is running (pnpm dev in apps/ui)\n'
          '  2. Port 4000 is available\n'
          '  3. You have an internet connection (if using remote API)');
    } on HttpException catch (e) {
      throw Exception('HTTP error: ${e.message}');
    } on FormatException catch (_) {
      throw Exception(
          'Invalid response from server. Please check the API endpoint.');
    } catch (e) {
      throw Exception('Failed to fetch component: $e');
    }
  }
}
