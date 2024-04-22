import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/screen/login_screen.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/screen/register_screen.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/screen/movie_list.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_list.dart';
import 'package:infs803_group7_frontend/src/share/token/domain/model/token_manager.dart';

// import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_login.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

const String url = "http://localhost:3000";
final TokenManager tokenManager = TokenManager();

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
        "/": (context) => const LoginScreen(),
        "/movies": (context) => const MovieList(),
        "/users": (context) => const UserList(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
      },
      // home: LoginScreen(),
      // home: FutureBuilder(
      //   future: token,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       final token = snapshot.data;
      //       return UserList(token: token!);
      //     } else {
      //       return const UserLogin();
      //     }
      //   },
      // ),
    );
  }
}
