import 'dart:convert';

import 'package:http/http.dart';
import 'package:infs803_group7_frontend/global.dart';

abstract class AuthDataSource {
  Future<Response> login(String username, String password);
  Future<Response> register(String name, String username, String password);
  Future<void> logout();
  Future<Response> forget(String username, String email);
}

class AuthRemoteDataSource implements AuthDataSource {
  @override
  Future<Response> login(String username, String password) async {
    String token = "";
    final result = await post(
      Uri.parse('$url/login'),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({"username": username, "password": password}),
    );

    if (result.statusCode == 200) {
      final data = await json.decode(result.body) as Map<String, dynamic>;
      token = data['token'].toString();

      tokenManager.setToken(token);
    }
    return result;
  }

  @override
  Future<Response> register(
    String name,
    String username,
    String password,
  ) async {
    String token = "";
    final result = await post(
      Uri.parse('$url/register'),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json
          .encode({"name": name, "username": username, "password": password}),
    );

    if (result.statusCode == 200) {
      final data = await json.decode(result.body) as Map<String, dynamic>;
      token = data['token'].toString();
      storage.write(key: "access", value: token);
      // user = User.fromJson(data);
      // final String token = data['token'].toString();
      // final String refreshToken = data['refresh_token'].toString();
      // final int expiresIn = int.parse(data['expires_in'].toString());
      // tokenManager.setToken(token, refreshToken, expiresIn);
    }
    // return user;
    return result;
  }

  @override
  Future<void> logout() async {}

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
