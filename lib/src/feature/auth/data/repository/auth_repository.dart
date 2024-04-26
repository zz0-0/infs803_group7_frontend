import 'package:http/http.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/datasource/auth_data_source.dart';

abstract class AuthRepository {
  Future<Response> login(String username, String password);
  Future<Response> register(String name, String username, String password);
  Future<Response> forget(String username, String email);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Response> login(String username, String password) {
    return authDataSource.login(username, password);
  }

  @override
  Future<Response> register(String name, String username, String password) {
    return authDataSource.register(name, username, password);
  }

  @override
  Future<Response> forget(String usename, String email) {
    return authDataSource.forget(usename, email);
  }
}
