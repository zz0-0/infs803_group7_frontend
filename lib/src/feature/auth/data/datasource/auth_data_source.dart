import 'dart:convert';

import 'package:http/http.dart';
import 'package:infs803_group7_frontend/global.dart';

abstract class AuthDataSource {
  Future<Response> login(String username, String password);
  Future<Response> register(String name, String username, String password);
  Future<bool> logout();
  Future<Response> forget(String username, String email);
}

class AuthRemoteDataSource implements AuthDataSource {
  @override
  Future<Response> login(String username, String password) async {
    final result = await post(
      Uri.parse('$url/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({"username": username, "password": password}),
    );

    if (result.statusCode == 200) {
      final data = await json.decode(result.body) as Map<String, dynamic>;
      final access = data['access'].toString();
      final refresh = data['refresh'].toString();
      tokenManager.setToken(access, refresh);
    }
    return result;
  }

  @override
  Future<Response> register(
    String name,
    String username,
    String password,
  ) async {
    final result = await post(
      Uri.parse('$url/register'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json
          .encode({"name": name, "username": username, "password": password}),
    );

    if (result.statusCode == 200) {
      final data = await json.decode(result.body) as Map<String, dynamic>;
      final access = data['access'].toString();
      final refresh = data['refresh'].toString();
      tokenManager.setToken(access, refresh);
    }
    return result;
  }

  @override
  Future<bool> logout() async {
    return tokenManager.deleteToken();
  }

  @override
  Future<Response> forget(String username, String email) async {
    final token = await tokenManager.token;

    final result = await post(
      Uri.parse('$url/forget'),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({"username": username, "password": email}),
    );

    return result;
  }
}
