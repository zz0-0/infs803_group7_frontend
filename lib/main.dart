import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_list.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_login.dart';

void main() {
  runApp(MyApp());
}

const String url = "localhost:3000";
var storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  Future<String> get jwt async {
    final jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  final bool loggedIn = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: <String, WidgetBuilder>{
        // "/movies": (BuildContext context) => const MovieList(),
        // "/users": (BuildContext context) => const UserList(),
        "/login": (BuildContext context) => const UserLogin(),
        "/signup": (BuildContext context) => const UserLogin(),
      },
      home: FutureBuilder(
        future: jwt,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final str = snapshot.data;
            final jwt = str!.split(".");
            final payload = json
                .decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
            if (DateTime.fromMillisecondsSinceEpoch(
              int.parse(payload["exp"] as String) * 1000,
            ).isAfter(DateTime.now())) {
              return UserList(jwt as String, payload as Map<String, dynamic>);
            } else {
              return UserLogin();
            }
          } else {
            return UserLogin();
          }
        },
      ),
    );
  }
}
