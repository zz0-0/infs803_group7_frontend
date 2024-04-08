import 'package:infs803_group7_frontend/src/feature/auth/data/datasource/auth_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/auth/domain/model/user.dart';

abstract class AuthRepository {
  Future<User> login({required User user});
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<User> login({required User user}) {
    return authDataSource.login(user: user);
  }
}
