import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/provider/user_provider.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier.dart';

final userListStateNotifierProvider =
    StateNotifierProvider<UserListStateNotifier, UserListState>((ref) {
  final UserListRepository userListRepository =
      ref.watch(userListRepositoryProvider);
  return UserListStateNotifier(userListRepository: userListRepository);
});

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>((ref) {
  final UserRepository userRepository = ref.watch(userRepositoryProvider);
  return UserStateNotifier(userRepository: userRepository);
});
