import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/state/auth_state_notifier_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("register"),
      ),
      body: SafeArea(
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
                  ref.read(authStateNotifierProvider.notifier).register(
                      usernameController.text, passwordController.text);
                }
              },
              child: const Text("register"),
            ),
          ],
        ),
      ),
    );
  }
}
