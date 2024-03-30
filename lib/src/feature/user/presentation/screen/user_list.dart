import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/widget/user_data.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList(this.jwt, this.payload, {super.key});
  final String jwt;
  final Map<String, dynamic> payload;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();

  factory UserList.fromBase64(String jwt) => UserList(
        jwt,
        json.decode(
          ascii.decode(base64.normalize(jwt.split(".")[1]) as List<int>),
        ) as Map<String, dynamic>,
      );
}

class _UserListState extends ConsumerState<UserList> {
  late final Future<List<User>> users;
  @override
  void initState() {
    super.initState();
    users = fetchUsers(widget.jwt);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: users,
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          return UserData(data: snapshot.data!);
        }
        return Container();
      },
    );
  }

  Future<List<User>> fetchUsers(String jwt) async {
    final result = await http.get(
      Uri.http(url, 'api/users'),
      headers: {"Authorization": jwt},
    );

    if (result.statusCode == 200) {
      final data = await json.decode(result.body);
      final userList = data["users"] as List;

      return userList
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }
}
