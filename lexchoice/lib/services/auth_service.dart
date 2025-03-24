import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const String baseUrl = 'http://localhost:8080/auth';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Registers a new user
  Future<Map<String, dynamic>> registerUser({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }

  /// Logs in a user and retrieves a token
  Future<String?> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      String token = jsonDecode(response.body)['token'];
      await _storage.write(key: "token", value: token);
      return token;
    } else {
      return null;
    }
  }

  Future<void> logoutUser() async {
    await _storage.delete(key: "token");
  }
}
