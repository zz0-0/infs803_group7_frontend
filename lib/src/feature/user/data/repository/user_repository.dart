import 'package:http/http.dart' as http;
import 'package:infs803_group7_frontend/src/feature/user/data/datasource/user_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';

abstract class UserRepository {
  Future<http.Response> createUser(User data);
  Future<User> getUser(int userId);
  Future<http.Response> updateUser(int userId, User data);
  Future<http.Response> deleteUser(int userId);
}

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<http.Response> createUser(User data) async {
    return userDataSource.createUser(data);
  }

  @override
  Future<http.Response> deleteUser(int userId) async {
    return userDataSource.deleteUser(userId);
  }

  @override
  Future<User> getUser(int userId) async {
    return userDataSource.getUser(userId);
  }

  @override
  Future<http.Response> updateUser(int userId, User data) async {
    return userDataSource.updateUser(userId, data);
  }
}
