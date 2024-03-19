import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class UserInfo extends ConsumerStatefulWidget {
  const UserInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoState();
}

class _UserInfoState extends ConsumerState<UserInfo> {
  String url = "https://abc.com/api/user/";

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<http.Response> createUser(Map data) {
    return http.post(Uri.parse(url), body: data);
  }

  Future<http.Response> fetchUser(int userId) {
    return http.get(Uri.parse("$url$userId"));
  }

  Future<http.Response> updateUser(int userId, Map data) {
    return http.post(Uri.parse("$url$userId"), body: data);
  }

  Future<http.Response> deleteUser(int userId) {
    return http.delete(Uri.parse("$url$userId"));
  }
}
