import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/main.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/state/auth_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_appbar_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldAppbarWidget(
      title: "Login",
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Implement forgot password screen
              },
              child: const Text('Forgot Password'),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  ref
                      .read(authStateNotifierProvider.notifier)
                      .login(usernameController.text, passwordController.text)
                      .then(
                    (value) async {
                      if (value.statusCode == 200) {
                        final data = await json.decode(value.body)
                            as Map<String, dynamic>;

                        if (int.parse(data["level"].toString()) > 1) {
                          final isAdmin = ref
                              .read(adminNotifierProvider.notifier)
                              .setAdminStatus(true);

                          isAdmin.then((value) {
                            ref.read(adminNotifierProvider);
                            MyApp.resetRoute(context);
                          });
                        } else {
                          final isAdmin = ref
                              .read(adminNotifierProvider.notifier)
                              .setAdminStatus(false);

                          isAdmin.then((value) {
                            ref.read(adminNotifierProvider);
                            MyApp.resetRoute(context);
                          });
                        }

                        context.go("/");
                      } else {
                        const snackBar = SnackBar(
                          content: Text("Incorrent username or password"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                children: <Widget>[
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      context.go("/register");
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
