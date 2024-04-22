import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/repository/auth_repository.dart';

class AuthStateNotifier extends StateNotifier<AsyncValue<String>> {
  final AuthRepository authRepository;

  AuthStateNotifier({required this.authRepository})
      : super(const AsyncValue.data(""));

  Future<String> login(String username, String password) async {
    var token = "";
    try {
      state = const AsyncValue.loading();
      token = await authRepository.login(username, password);
    } catch (e) {
      // state = const AsyncError("error", e);
    } finally {
      state = const AsyncValue.data("");
    }
    return token;
  }

  Future<void> register(String username, String password) async {
    try {
      state = const AsyncValue.loading();
      await authRepository.register(username, password);
    } catch (e) {
      // state = const AsyncError("error", e);
    } finally {
      state = const AsyncValue.data("");
    }
  }

  Future<void> forget(String username, String email) async {
    try {
      state = const AsyncValue.loading();
      await authRepository.forget(username, email);
    } catch (e) {
      // state = const AsyncError("error", e);
    } finally {
      state = const AsyncValue.data("");
    }
  }
}
