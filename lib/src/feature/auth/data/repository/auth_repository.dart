import 'package:infs803_group7_frontend/src/feature/auth/data/datasource/auth_data_source.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
  Future<User> register(String username, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<User> login(String username, String password) {
    return authDataSource.login(username, password);
  }

  @override
  Future<User> register(String username, String password) {
    return authDataSource.register(username, password);
  }
}
