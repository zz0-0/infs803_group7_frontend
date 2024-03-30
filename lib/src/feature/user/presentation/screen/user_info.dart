import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';

class UserInfo extends ConsumerStatefulWidget {
  const UserInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoState();
}

class _UserInfoState extends ConsumerState<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<http.Response> createUser(User data) {
    return http.post(Uri.parse(url), body: data.toJson());
  }

  Future<http.Response> fetchUser(int userId) {
    return http.get(Uri.parse("$url$userId"));
  }

  Future<http.Response> updateUser(int userId, User data) {
    return http.post(Uri.parse("$url$userId"), body: data.toJson());
  }

  Future<http.Response> deleteUser(int userId) {
    return http.delete(Uri.parse("$url$userId"));
  }
}
