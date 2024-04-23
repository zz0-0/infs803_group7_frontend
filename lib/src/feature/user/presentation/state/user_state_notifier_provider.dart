import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_list_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/data/repository/user_repository.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/provider/user_provider.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

// final userListStateNotifierProvider =
//     StateNotifierProvider<UserListStateNotifier, AsyncValue>((ref) {
//   final UserListRepository userListRepository =
//       ref.watch(userListRepositoryProvider);
//   return UserListStateNotifier(userListRepository: userListRepository);
// });

// final userStateNotifierProvider =
//     StateNotifierProvider<UserStateNotifier, AsyncValue>((ref) {
//   final UserRepository userRepository = ref.watch(userRepositoryProvider);
//   return UserStateNotifier(userRepository: userRepository);
// });

final userListStreamProvider = StreamProvider((ref) {
  final UserListRepository userListRepository =
      ref.watch(userListRepositoryProvider);
  return Stream.fromFuture(userListRepository.getUserList());
});

final userGetStreamProvider = StreamProviderFamily<User, int>((ref, id) {
  final UserRepository userRepository = ref.watch(userRepositoryProvider);
  return Stream.fromFuture(userRepository.getUser(id));
});

final userDeleteStreamProvider = StreamProviderFamily<Response, int>((ref, id) {
  final UserRepository userRepository = ref.watch(userRepositoryProvider);
  return Stream.fromFuture(userRepository.deleteUser(id));
});

final userModifyStreamProvider =
    StreamProviderFamily<Response, User>((ref, user) {
  final UserRepository userRepository = ref.watch(userRepositoryProvider);
  return Stream.fromFuture(userRepository.updateUser(user.id, user));
});
