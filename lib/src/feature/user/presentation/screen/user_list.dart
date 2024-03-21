import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/widget/data.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  String url = "localhost:3000";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          return Data(data: snapshot.data!);
        }
      },
    );
  }

  Future<List<User>> fetchUsers() async {
    final result = await http.get(Uri.http(url, 'api/users'));

    final List<User> users = [];
    // if (result.statusCode == 200) {
    final data = json.decode(result.body) as List;
    // final List dataList = data["users"] as List;
    return data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
    // }

    // return users;
  }
}
