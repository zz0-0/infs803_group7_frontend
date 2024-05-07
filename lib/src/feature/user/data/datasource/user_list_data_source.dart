import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';
import 'package:infs803_group7_frontend/src/share/token/domain/model/token_manager.dart';

abstract class UserListDataSource {
  Future<List<User>> getUserList();
}

class UserListRemoteDataSource implements UserListDataSource {
  @override
  Future<List<User>> getUserList() async {
    final token = await tokenManager.token;

    final result = await http.get(
      Uri.parse("$url/users"),
      headers: {
        "Authorization": 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final List<User> users = [];

    if (result.statusCode == 200) {
      final data = json.decode(result.body) as Map<String, dynamic>;
      final List dataList = data["users"] as List;
      return dataList
          .map((e) {
            final u = User.fromJson(e as Map<String, dynamic>);
            return u;
          })
          .where((e) => e.deleted != true)
          .toList();
    } else if (result.statusCode == 401) {
      final response = await TokenManager().refreshToken();
      if (response!.statusCode == 200) {
        getUserList();
      }
    }
    return users;
  }
}
