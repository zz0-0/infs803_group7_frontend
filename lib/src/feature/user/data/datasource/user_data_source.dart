import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

abstract class UserDataSource {
  Future<http.Response> createUser(User data);
  Future<User> getUser(int userId);
  Future<http.Response> updateUser(int userId, User data);
  Future<http.Response> deleteUser(int userId);
}

class UserRemoteDataSource implements UserDataSource {
  @override
  Future<http.Response> createUser(User data) async {
    return http.post(
      Uri.parse("$url/user"),
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data.toJson(),
    );
  }

  @override
  Future<http.Response> deleteUser(int userId) async {
    return http.delete(
      Uri.parse("$url/user/$userId"),
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
      // headers: {
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
    );
  }

  @override
  Future<User> getUser(int userId) async {
    late User user;
    final result = await http.get(
      Uri.parse("$url/user/$userId"),
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (result.statusCode == 200) {
      final data = json.decode(result.body) as Map<String, dynamic>;
      user = User.fromJson(data);
    } else if (result.statusCode == 401) {
      await tokenManager.refreshToken();
      await getUser(userId);
    }
    return user;
  }

  @override
  Future<http.Response> updateUser(int userId, User data) async {
    return http.patch(
      Uri.parse("$url/user/$userId"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data),
    );
  }
}
