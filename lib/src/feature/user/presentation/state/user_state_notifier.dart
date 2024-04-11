import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';

class UserListStateNotifier extends StateNotifier<AsyncValue<void>> {
  final UserListRepository userListRepository;

  UserListStateNotifier({required this.userListRepository})
      : super(const AsyncValue.data(null));

  Future<List<User>> getUserList() async {
    final response = await userListRepository.getUserList();

    // try {
    //   state = const AsyncValue.loading();
    //   response = await userListRepository.getUserList();
    // } catch (e) {
    //   // state = const AsyncError("error", e);
    // } finally {
    //   state = const AsyncValue.data(null);
    // }

    return response;
  }
}

// TODO
class UserStateNotifier extends StateNotifier<AsyncValue<void>> {
  final UserRepository userRepository;

  UserStateNotifier({required this.userRepository})
      : super(const AsyncValue.data(null));
}
