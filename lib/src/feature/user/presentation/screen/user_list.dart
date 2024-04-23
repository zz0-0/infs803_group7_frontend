import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/screen/user_info.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  @override
  Widget build(BuildContext context) {
    final value = ref.read(userListStreamProvider);
    return value.when(
      data: (List<User> data) {
        return Material(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final user = data[index];

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
                        context.goNamed(
                          "user",
                          pathParameters: {"userId": user.id.toString()},
                        );
                      },
                      child: const Text('Edit'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          var message =
                              ref.read(userDeleteStreamProvider(user.id));
                          message.whenData((value) => print(value.body));
                        });
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Center(
          child: Text(
            error.toString(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.red),
          ),
        );
      },
      loading: () {
        return LoadingAnimationWidget.halfTriangleDot(
          color: Colors.white,
          size: 30,
        );
      },
    );
  }
}
