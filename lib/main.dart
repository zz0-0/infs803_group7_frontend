import 'package:flutter/material.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/screen/movie_list.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_list.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        "/movies": (BuildContext context) => const MovieList(),
        "/users": (BuildContext context) => const UserList(),
        "/login": (BuildContext context) => const UserLogin(),
        "/signup": (BuildContext context) => const UserLogin(),
      },
      home: loggedIn ? const MovieList() : const UserLogin(),
    );
  }
}
