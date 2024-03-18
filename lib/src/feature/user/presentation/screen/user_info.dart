import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> createUser() {
    return http.post(Uri.parse("https://abc.com/user/1"));
  }

  Future<http.Response> fetchUser() {
    return http.get(Uri.parse("https://abc.com/user/1"));
  }

  Future<http.Response> updateUser() {
    return http.post(Uri.parse("https://abc.com/user/1"));
  }

  Future<http.Response> deleteUser() {
    return http.delete(Uri.parse("https://abc.com/user/1"));
  }
}
