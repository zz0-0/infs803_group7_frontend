import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';

abstract class UserListDataSource {
  Future<List<User>> getUserList();
}

class UserListRemoteDataSource implements UserListDataSource {
  @override
  Future<List<User>> getUserList() async {
    final result = await http.get(
      Uri.parse("$url/users"),
      headers: {"Authorization": 'Bearer ${tokenManager.token}'},
    );
    final List<User> users = [];
    if (result.statusCode == 200) {
      final data = json.decode(result.body) as Map<String, dynamic>;
      final List dataList = data["users"] as List;
      return dataList
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (result.statusCode == 401) {
      await tokenManager.refreshToken();
      await getUserList();
      return [];
    }
    return users;
  }
}
