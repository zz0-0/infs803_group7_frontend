import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/repository/auth_repository.dart';
import 'package:infs803_group7_frontend/src/feature/auth/domain/provider/auth_provider.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/state/auth_state_notifier.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AsyncValue>((ref) {
  final AuthRepository authRepository = ref.watch(authRepositoryProvider);
  return AuthStateNotifier(authRepository: authRepository);
});
