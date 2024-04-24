import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/provider/user_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

class UserListStateNotifier extends StateNotifier<AsyncValue<List<User>>> {
  final Ref ref;
  UserListStateNotifier(
    this.ref,
  ) : super(const AsyncLoading()) {
    getUserList();
  }

  Future<void> getUserList() async {
    final UserListRepository userListRepository =
        ref.watch(userListRepositoryProvider);
    state = await AsyncValue.guard(() => userListRepository.getUserList());
  }
}

class UserStateNotifier extends StateNotifier<AsyncValue<User>> {
  final Ref ref;
  final int id;

  UserStateNotifier(
    this.ref,
    this.id,
  ) : super(const AsyncLoading()) {
    getUser();
  }

  Future<void> createUser() async {}

  Future<void> getUser() async {
    final UserRepository userRepository = ref.watch(userRepositoryProvider);
    state = await AsyncValue.guard(() => userRepository.getUser(id));
  }

  Future<void> updateUser(User updateUser) async {
    final UserRepository userRepository = ref.watch(userRepositoryProvider);
    final response = await userRepository.updateUser(id, updateUser);
  }

  // Future<void> delete(int id) async {
  //   final UserRepository userRepository = ref.watch(userRepositoryProvider);
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() => userRepository.deleteUser(id));
  // }
}
