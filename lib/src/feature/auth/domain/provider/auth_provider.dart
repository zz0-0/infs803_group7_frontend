import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/datasource/auth_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/repository/auth_repository.dart';

final authDataSourceProvider = Provider((ref) => AuthRemoteDataSource());

final authRepositoryProvider = Provider(
  (ref) {
    final AuthDataSource authDataSource = ref.watch(authDataSourceProvider);
    return AuthRepositoryImpl(authDataSource);
  },
);

final adminProvider = StateProvider((ref) => false);
