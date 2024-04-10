import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/datasource/user_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/datasource/user_list_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_repository.dart';

final userListDataSourceProvider =
    Provider((ref) => UserListRemoteDataSource());

final userListRepositoryProvider = Provider(
  (ref) {
    final UserListDataSource userDataSource =
        ref.watch(userListDataSourceProvider);
    return UserListRepositoryImpl(userDataSource);
  },
);

final userDataSourceProvider = Provider((ref) => UserRemoteDataSource());

final userRepositoryProvider = Provider((ref) {
  final UserDataSource userDataSource = ref.watch(userDataSourceProvider);
  return UserRepositoryImpl(userDataSource);
});
