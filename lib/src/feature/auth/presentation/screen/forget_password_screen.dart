import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/state/auth_state_notifier_provider.dart';

class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
            ),
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
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
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
                  // Implement login logic here
                  ref
                      .read(authStateNotifierProvider.notifier)
                      .forget(usernameController.text, emailController.text);
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
                      // Implement sign-up navigation
                      Navigator.pushNamed(context, "/register");
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
