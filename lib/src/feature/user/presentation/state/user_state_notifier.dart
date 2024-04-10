import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state.dart';

class UserListStateNotifier extends StateNotifier<UserListState> {
  final UserListRepository userListRepository;

  UserListStateNotifier({required this.userListRepository})
      : super(UserListInitial());

  Future<List<User>> getUserList() async {
    state = UserListLoading();
    final response = await userListRepository.getUserList();

    if (response != "") {
      state = UserListSuccess();
    } else {
      state = UserListFailure();
    }

    return response;
  }
}

// TODO
class UserStateNotifier extends StateNotifier<UserState> {
  final UserRepository userRepository;

  UserStateNotifier({required this.userRepository}) : super(UserInitial());

  // Future<User> getUser() async {
  //   state = UserLoading();
  //   final response = await userRepository.getUser();

  //   if (response != "") {
  //     state = UserSuccess();
  //   } else {
  //     state = UserFailure();
  //   }

  //   return response;
  // }

  // Future<void> createUser() async {
  //   state = UserLoading();
  //   userRepository.createUser();
  // }

  // Future<void> updateUser() async {
  //   state = UserLoading();
  //   userRepository.updateUser();
  // }

  // Future<void> deleteUser() async {
  //   state = UserLoading();
  //   userRepository.deleteUser();
  // }
}
