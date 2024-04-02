import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';

class UserInfo extends ConsumerStatefulWidget {
  final String token;
  const UserInfo({
    super.key,
    required this.token,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoState();
}

class _UserInfoState extends ConsumerState<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<http.Response> createUser(User data) {
    return http.post(
      Uri.parse("$url/api/user"),
      headers: {"Authorization": 'Bearer ${widget.token}'},
      body: data.toJson(),
    );
  }

  Future<http.Response> fetchUser(int userId) {
    return http.get(
      Uri.parse("$url/api/user/$userId"),
      headers: {"Authorization": 'Bearer ${widget.token}'},
    );
  }

  Future<http.Response> updateUser(int userId, User data) {
    return http.post(
      Uri.parse("$url/api/user/$userId"),
      headers: {"Authorization": 'Bearer ${widget.token}'},
      body: data.toJson(),
    );
  }

  Future<http.Response> deleteUser(int userId) {
    return http.delete(
      Uri.parse("$url/api/user/$userId"),
      headers: {"Authorization": 'Bearer ${widget.token}'},
    );
  }
}
