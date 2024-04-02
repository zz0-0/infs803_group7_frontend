import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/main.dart';

import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_list.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Form(
      key: key,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }

              return null;
            },
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }

              return null;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (key.currentState!.validate()) {
                // call backend
                await attempLogin(
                  usernameController.text,
                  passwordController.text,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserList(),
                  ),
                );
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }

  Future<String> attempLogin(String username, String password) async {
    final result = await http.post(
      Uri.parse('$url/api/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({"username": username, "password": password}),
    );

    if (result.statusCode == 200) {
      final data = await json.decode(result.body) as Map<String, dynamic>;
      final String token = data['token'].toString();
      final String refreshToken = data['refresh_token'].toString();
      final int expiresIn = int.parse(data['expires_in'].toString());
      tokenManager.setToken(token, refreshToken, expiresIn);
      return token;
    } else {
      return "";
    }
  }
}
