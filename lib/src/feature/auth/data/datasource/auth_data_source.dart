import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';
import 'package:infs803_group7_frontend/src/feature/auth/domain/model/user.dart';

abstract class AuthDataSource {
  Future<User> login({required User user});
}

class AuthRemoteDataSource implements AuthDataSource {
  @override
  Future<User> login({required User user}) async {
    final result = await http.post(
      Uri.parse('$url/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({"username": user.username, "password": user.password}),
    );

    if (result.statusCode == 200) {
      final data = await json.decode(result.body) as Map<String, dynamic>;
      final String token = data['token'].toString();
      final String refreshToken = data['refresh_token'].toString();
      final int expiresIn = int.parse(data['expires_in'].toString());
      tokenManager.setToken(token, refreshToken, expiresIn);
    }
    return user;
  }
}
