import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/auth/domain/provider/auth_provider.dart';

class LogoutWidget extends ConsumerWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final bool isDelete = await ref.read(authRepositoryProvider).logout();
        if (isDelete) {
          context.go("/login");
        }
      },
      icon: const Icon(Icons.logout),
    );
  }
}
