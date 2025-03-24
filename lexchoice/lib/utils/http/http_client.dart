import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lexchoice/utils/local_storage/storage_utility.dart';

class LCHttpHelper {
  static const String _baseUrl = 'http://localhost:8080'; // Update this with your backend URL
  static final LCLocalStorage _storage = LCLocalStorage();

  // Get auth token
  static String? _getAuthToken() {
    return _storage.readData<String>('auth_token');
  }

  // Add auth header
  static Map<String, String> _getHeaders() {
    final token = _getAuthToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(),
    );
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(),
    );
    return _handleResponse(response);
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      // Handle unauthorized access
      _storage.removeData('auth_token');
      throw Exception('Unauthorized access. Please login again.');
    } else {
      final errorBody = json.decode(response.body);
      throw Exception(errorBody['message'] ?? 'Failed to load data: ${response.statusCode}');
    }
  }

  // Save auth token
  static Future<void> saveAuthToken(String token) async {
    await _storage.saveData('auth_token', token);
  }

  // Clear auth token
  static Future<void> clearAuthToken() async {
    await _storage.removeData('auth_token');
  }
}