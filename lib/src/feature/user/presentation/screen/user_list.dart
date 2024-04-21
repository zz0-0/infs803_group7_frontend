import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_info.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.read(userListStateNotifierProvider.notifier).getUserList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<User> users = snapshot.data!;
          return Material(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = users[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      user.name[0],
                    ), // Display first letter of user's name
                  ),
                  title: Text(user.name),
                  subtitle: Text('User ID: $index'),
                  onTap: () {
                    // Handle user tap (e.g., navigate to user profile)
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle editing logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserInfo(id: user.id),
                            ),
                          );
                        },
                        child: Text('Edit'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Handle delete logic here
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
