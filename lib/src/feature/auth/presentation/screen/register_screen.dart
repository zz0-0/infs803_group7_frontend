import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/state/auth_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/provider/user_provider.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final levelController = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final User user = User(
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password Again',
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  user.id = ref.read(userIdProvider) + 1;
                  user.deleted = false;
                  user.createdAt = DateTime.now();
                  user.updatedAt = DateTime.now();
                  user.name = nameController.text;
                  user.username = usernameController.text;
                  user.password = passwordController.text;
                  user.level = int.parse(levelController.text);

                  ref
                      .read(userRepositoryProvider)
                      .updateUser(user.id - 1, user)
                      .then(
                    (value) {
                      // ref.refresh(userListStateNotifierProvider);
                      context.go("/users");
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      context.go("/login");
                    },
                    child: const Text('Login'),
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
