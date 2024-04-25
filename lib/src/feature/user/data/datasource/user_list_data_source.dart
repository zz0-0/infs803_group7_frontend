import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/global.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

abstract class UserListDataSource {
  Future<List<User>> getUserList();
}

class UserListRemoteDataSource implements UserListDataSource {
  @override
  Future<List<User>> getUserList() async {
    final container = ProviderContainer();
    final result = await http.get(
      Uri.parse("$url/users"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // headers: {"Authorization": 'Bearer ${tokenManager.token}'},
    );
    final List<User> users = [];

    if (result.statusCode == 200) {
      // print(json.decode(result.body)["users"][0][1]);

      // final users = json.decode(result.body)["users"];
      // final dataList = users as List;

      final data = json.decode(result.body) as Map<String, dynamic>;
      final List dataList = data["users"] as List;
      return dataList
          .map((e) {
            final u = User.fromJson(e as Map<String, dynamic>);
            // u.id2 = e[0].toString();
            // u.id = e[0];
            return u;
          })
          .where((e) => e.deleted != true)
          .toList();
    } else if (result.statusCode == 401) {
      await tokenManager.refreshToken();
      await getUserList();
      return [];
    }
    return users;
  }
}
