import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/repository/auth_repository.dart';

class AuthStateNotifier extends StateNotifier<AsyncValue<Response>> {
  final AuthRepository authRepository;

  AuthStateNotifier({required this.authRepository})
      : super(const AsyncValue.loading());

  Future<Response> login(String username, String password) async {
    state = const AsyncValue.loading();
    final result = authRepository.login(username, password);
    state = await AsyncValue.guard(() => result);
    return result;
  }

  Future<Response> register(
    String name,
    String username,
    String password,
  ) async {
    state = const AsyncValue.loading();
    final result = authRepository.register(name, username, password);
    state = await AsyncValue.guard(() => result);
    return result;
  }

  Future<Response> forget(String username, String email) async {
    state = const AsyncValue.loading();
    final result = authRepository.forget(username, email);
    state = await AsyncValue.guard(() => result);
    return result;
  }
}
