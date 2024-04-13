import 'package:infs803_group7_frontend/src/feature/user/data/datasource/user_list_data_source.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

abstract class UserListRepository {
  Future<List<User>> getUserList();
}

class UserListRepositoryImpl extends UserListRepository {
  final UserListDataSource userListDataSource;

  UserListRepositoryImpl(this.userListDataSource);

  @override
  Future<List<User>> getUserList() {
    return userListDataSource.getUserList();
  }
}
