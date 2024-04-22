import 'package:infs803_group7_frontend/src/feature/auth/data/datasource/auth_data_source.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

abstract class AuthRepository {
  Future<String> login(String username, String password);
  Future<User> register(String username, String password);
  Future<bool> forget(String username, String email);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<String> login(String username, String password) {
    return authDataSource.login(username, password);
  }

  @override
  Future<User> register(String username, String password) {
    return authDataSource.register(username, password);
  }

  @override
  Future<bool> forget(String usename, String email) {
    return authDataSource.forget(usename, email);
  }
}
