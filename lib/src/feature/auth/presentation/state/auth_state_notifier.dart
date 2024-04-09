import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/repository/auth_repository.dart';
import 'package:infs803_group7_frontend/src/feature/auth/presentation/state/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthStateNotifier({required this.authRepository}) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    state = AuthLoading();
    final response = await authRepository.login(username, password);

    if (response.token != "") {
      state = AuthSuccess();
    } else {
      state = AuthFailure();
    }
  }

  Future<void> register(String username, String password) async {
    state = AuthLoading();
    final response = await authRepository.register(username, password);

    if (response.token != "") {
      state = AuthSuccess();
    } else {
      state = AuthFailure();
    }
  }
}
