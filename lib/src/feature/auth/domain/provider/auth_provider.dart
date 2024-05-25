import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/datasource/auth_data_source.dart';
import 'package:infs803_group7_frontend/src/feature/auth/data/repository/auth_repository.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/admin_manager.dart';

final authDataSourceProvider = Provider((ref) => AuthRemoteDataSource());

final authRepositoryProvider = Provider(
  (ref) {
    final AuthDataSource authDataSource = ref.watch(authDataSourceProvider);
    return AuthRepositoryImpl(authDataSource);
  },
);

// Initialize the adminProvider based on stored value
// final adminProvider = StateProvider<bool>((ref) async {
//   bool isAdmin = await AdminManager().getAdminStatus();
//   return isAdmin;
// });

// Use FutureProvider to handle async initialization
final adminFutureProvider = FutureProvider<bool>((ref) async {
  final bool isAdmin = await AdminManager().getAdminStatus();
  return isAdmin;
});
