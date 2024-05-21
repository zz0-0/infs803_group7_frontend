import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infs803_group7_frontend/src/feature/user/presentation/state/user_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/user.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_appbar_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserInfo extends ConsumerStatefulWidget {
  final int id;

  const UserInfo({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoState();
}

class _UserInfoState extends ConsumerState<UserInfo> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateNotifierProvider(widget.id - 1));

    return user.when(
      data: (User? data) {
        // final nameController = TextEditingController(text: data!.name);
        // final usernameController = TextEditingController(text: data.username);

        return AdaptiveScaffoldAppbarWidget(
          title: "User Info",
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Name: ${data!.name}",
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Username: ${data.username}",
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Level: ${data.username}",
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     data.name = nameController.text;
                  //     data.username = usernameController.text;
                  //     ref
                  //         .read(userRepositoryProvider)
                  //         .updateUser(widget.id - 1, data)
                  //         .then(
                  //       (value) {
                  //         ref.refresh(userListStateNotifierProvider);
                  //         context.push("/users");
                  //       },
                  //     );
                  //   },
                  //   child: const Text('Submit'),
                  // ),
                ],
              ),
            ),
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
