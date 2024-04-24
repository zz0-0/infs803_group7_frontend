import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  @override
  Widget build(BuildContext context) {
    // final value = ref.watch(userListFutureProvider);
    final value = ref.watch(userListStateNotifierProvider);
    return value.when(
      skipLoadingOnReload: false,
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("User List"),
          ),
          body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final user = data[index];

              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    user.name[0],
                  ), // Display first letter of user's name
                ),
                title: Text(
                  "Name: ${user.name}             Username: ${user.username}",
                ),
                subtitle: Text('User ID: ${user.id}'),
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
                          pathParameters: {"userId": (user.id - 1).toString()},
                        );
                      },
                      child: const Text('Edit'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        user.deleted = true;
                        ref
                            .read(
                              userStateNotifierProvider(user.id - 1).notifier,
                            )
                            .updateUser(user)
                            .then(
                              (value) =>
                                  ref.refresh(userListStateNotifierProvider),
                            );
                      },
                      child: value.isLoading
                          ? LoadingAnimationWidget.halfTriangleDot(
                              color: Colors.deepPurple,
                              size: 20,
                            )
                          : const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.go("/user_add");
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
                .titleLarge!
                .copyWith(color: Colors.red),
          ),
        );
      },
      loading: () {
        return LoadingAnimationWidget.halfTriangleDot(
          color: Colors.deepPurple,
          size: 100,
        );
      },
    );
  }
}
