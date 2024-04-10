import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/domain/model/user.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/widget/user_data.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
      ),
      body: FutureBuilder(
        future: ref.read(userListStateNotifierProvider.notifier).getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return UserData(data: snapshot.data!);
          }
          return Container();
        },
      ),
    );
  }
}
