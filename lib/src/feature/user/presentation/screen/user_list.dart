import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  String url = "https://127.0.0.1:3000/api/users/";
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Expanded(
            child: Text(
              'ID',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Created At',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Updated At',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: users
          .map(
            (e) => DataRow(
              cells: [
                DataCell(
                  Text(e.id as String),
                ),
                DataCell(
                  Text(e.name),
                ),
                DataCell(
                  Text(e.createdAt! as String),
                ),
                DataCell(
                  Text(e.updatedAt! as String),
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  Future<http.Response> fetchUsers() async {
    final result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final data = jsonDecode(result.body);
      data['users'].forEach(
        (value) => users
            .add(User(id: value["id"] as int, name: value["name"] as String)),
      );
    }
    return result;
  }
}
