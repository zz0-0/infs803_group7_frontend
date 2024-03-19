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
  String url = "https://abc.com/api/users/";
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Expanded(
            child: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text('Alex')),
          ],
        ),
      ],
    );
  }

  Future<http.Response> fetchUsers() async {
    final result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final data = jsonDecode(result.body);
      data['user'].forEach(
        (value) => users
            .add(User(id: value["id"] as int, name: value["name"] as String)),
      );
    }
    return result;
  }
}
