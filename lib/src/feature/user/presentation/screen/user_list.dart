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
  late final Future<List<User>> users;
  @override
  void initState() {
    super.initState();
    users = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: users,
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

    if (result.statusCode == 200) {
      final data = await json.decode(result.body) as List;
      return data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      return [];
    }
  }
}
