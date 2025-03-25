import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  // static const String _baseUrl = "https://kickoff-1gj1.onrender.com";
  static const String _baseUrl = "http://127.0.0.1:10000";

  // http://127.0.0.1:10000

  /// Generic GET request
  static Future<dynamic> get(String endpoint) async {
    final Uri url = Uri.parse("$_baseUrl$endpoint");

    try {
      final response = await http.get(url, headers: {"Content-Type": "application/json"});

      return _handleResponse(response);
    } catch (e) {
      throw Exception("GET request failed: $e");
    }
  }

  /// Generic POST request
  static Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final Uri url = Uri.parse("$_baseUrl$endpoint");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("POST request failed: $e");
    }
  }

  /// Handle API responses
  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error: ${response.statusCode} - ${response.body}");
    }
  }
}
