import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

final userListStateNotifierProvider =
    StateNotifierProvider<UserListStateNotifier, AsyncValue<List<User>>>((ref) {
  return UserListStateNotifier(ref);
});

final userStateNotifierProvider =
    StateNotifierProvider.family<UserStateNotifier, AsyncValue<User?>, int>(
        (ref, id) {
  return UserStateNotifier(ref, id);
});
